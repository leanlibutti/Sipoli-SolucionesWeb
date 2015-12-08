class CouchesController < ApplicationController
  before_action :get_couch, only:[:edit, :update, :destroy, :show]

  def searchnombre
    @contenido = params[:contenido]
    if (@contenido.to_i != 0) && (@contenido != "0")
      flash[:notice] = "Nombre no puede contener numeros"
    else
      flash[:notice] = " "
    end
    #if (@contenido.integer?)
    #  flash[:notice] = "Nombre no puede contener numeros"
    #end

  end

   def searchlugar
    @contenido = params[:contenido]
    @contenido2 = params[:contenido2]
    @contenido3 = params[:contenido3]
    if (@contenido.to_i != 0) && (@contenido != "0") || (@contenido2.to_i != 0) && (@contenido2 != "0") || (@contenido3.to_i != 0) && (@contenido3 != "0")
      flash[:notice] = "Nombre no puede contener numeros"
    else
        flash[:notice] = " "
    end
    #if (@contenido.integer?) &&  (@contenido.integer?) &&  (@contenido.integer?) 
  end

  def get_couch
    @couch = Couch.find(params[:id])
  end 

  def index
  end

  def show
  end

  def new
    @couch = Couch.new 
  end

  def edit
  end

  def create
    @couch = Couch.new(params.require(:couch).permit(:nombre, :descripcion, :user_id, :category_id, :ciudad, :provincia, :capacidad, :pais, :url))
    @couch.user_id = current_user.id
    if @couch.save
      flash[:notice] = "Couch creado correctamente."
      redirect_to @couch
    else
      flash[:notice] = "Error al crear el Couch."
      render 'new'
    end
  end

  def update
    if @couch.update(params.require(:couch).permit(:nombre, :descripcion, :category_id, :ciudad, :provincia, :capacidad, :pais, :url))
      flash[:notice] = "Couch editado correctamente."
      redirect_to couches_path
    else
      flash[:notice] = "Error al editar el couch."
      render 'edit'
    end
  end

  def destroy
    if @couch.destroy;
      flash[:notice] = "Couch borrado correctamente."
      redirect_to @couch
    else
      flash[:notice] = "Error al borrar el Couch."
    end
  end
end
