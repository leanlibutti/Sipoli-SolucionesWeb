class ValorationusersController < ApplicationController

def index
end

 def create 

 	@user = User.find(params[:user_id])

 	@valorationuser = @user.valorationusers.new(valoration_params)

 	@valorationuser.userValora_id = current_user.id

 	if @valorationuser.save
      flash[:notice] = "Validacion creada correctamente."
    else
      flash[:notice] = "Error al validar."
    end
 #	@valoration = @couch.valorations.create(valoration_params)
    
    redirect_to myreservations_reservations_path
  end 

private 

def valoration_params
  params.require(:valorationuser).permit(:valor,:userValora_id)
end



end
