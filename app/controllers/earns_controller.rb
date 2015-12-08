class EarnsController < ApplicationController
  before_action :set_earn, only: [:show, :edit, :update, :destroy]

  # GET /earns
  # GET /earns.json
  def index
    @earns = Earn.all
  end

  # GET /earns/1
  # GET /earns/1.json
  def show
  end

  # GET /earns/new
  def new
    @earn = Earn.new
  end

  # GET /earns/1/edit
  def edit
  end

  # POST /earns
  # POST /earns.json
  def create
   @earn = Earn.new(earn_params)
   @earn.save
   @earn.valor = (Payment.where("? <= created_at AND created_at <= ?",@earn.fech_ing, @earn.fech_egr).count )* 9.99
    respond_to do |format|
      if @earn.save
        format.html { redirect_to @earn, notice: 'La ganancia ha sido calculada.' }
        format.json { render :show, status: :created, location: @earn }
      else
        format.html { render :new }
        format.json { render json: @earn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /earns/1
  # PATCH/PUT /earns/1.json
  def update
    respond_to do |format|
      if @earn.update(earn_params)
        format.html { redirect_to @earn, notice: 'Earn was successfully updated.' }
        format.json { render :show, status: :ok, location: @earn }
      else
        format.html { render :edit }
        format.json { render json: @earn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /earns/1
  # DELETE /earns/1.json
  def destroy
    @earn.destroy
    respond_to do |format|
      format.html { redirect_to earns_url, notice: 'La ganancia calculada fue eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_earn
      @earn = Earn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def earn_params
      params.require(:earn).permit(:fech_ing, :fech_egr, :valor)
    end
end
