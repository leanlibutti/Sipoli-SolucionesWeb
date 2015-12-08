class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :mydates]

  def registrados   
   ini = params[:fechaini]
   fin = params[:fechafin]
   @registrados = User.where("? <= created_at AND created_at <= ? ",ini, fin)
   if (ini.blank?) || (ini < fin)
       flash[:notice] = " "  
    elsif  (ini == fin) 
      flash[:notice] = "Las fechas no pueden ser iguales"
    else
      flash[:notice] = "La fecha final no pueden ser menor a la inicial"
    end
  end

  def reservationaccepted
    @reservas = Reservation.where("? <= created_at AND created_at <= ? AND confirmacion = ? AND pendiente = ?",params[:fechaini], params[:fechafin], true, false)
 end
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new(couch_id: params[:couch_id])
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:couch_id, :confirmacion,:fech_ing, :fech_egr))
    @reservation.user_id = current_user.id 
    @reservation.confirmacion= false
    @reservation.pendiente= true
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'La reserva fue creada exitosamente!.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
    @reservation.save
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    eliminar_reservas_coincidentes
    respond_to do |format|
      if @reservation = Reservation.update(@reservation.id, confirmacion: true, pendiente:false)
        format.html {redirect_to reservations_path, notice: 'La reserva fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @reservation }
        
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    if (@reservation.user_id == current_user.id)
      @reservation.destroy
    else
      @reservation.pendiente = false
      @reservation.save
    end
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'La reserva fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:couch_id, :user_id, :fech_ing, :fech_egr)
    end

    def eliminar_reservas_coincidentes

    rango = @reservation.fech_ing..@reservation.fech_egr

    #eliminar todas las reservas del usuario actual sin confirmar y que ocupan las mismas fechas de la confirmada

    r = Reservation.where(confirmacion:false, pendiente:true, couch_id: @reservation.couch_id)

    r.each do |res|
      aux = res.fech_ing..res.fech_egr
      if aux.overlaps?(rango)
        res.pendiente= false
        res.save
        flash[:notice] = "Una reserva del usuario fue eliminada debido a fechas coincidentes con la reserva aceptada recientemente"
      end
    end
  end
end
