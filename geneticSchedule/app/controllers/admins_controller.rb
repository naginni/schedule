class AdminsController < ApplicationController 
  before_action :set_user_cargo_work, only: [:destroyUserCargo]

   def panelAdmin
     @user_cargo_works = UserCargoWork.where(:estado => true).paginate(:page => params[:page], :per_page => 10)
   end 

   def usersAddCargos
      user = User.find(params[:user])
      cargo = Cargo.find(params[:cargo])
      # se validan los datos que llegan por get para verificar si existen los parametros	
      if !user || !cargo 
	format.html { redirect_to user_path(user), flash: { danger:  'El usuario o el cargo no existe.'} }
      elsif UserCargoWork.find_by(user_id: user.id, cargo_id: cargo.id)
	format.html { redirect_to user_path(user), flash: { info:  'El cargo ya se encuentra asignado al usuario.'} }
      end 
      # se agregan los datos para ser creados en la relacion del usuar y el cargo 
       @user_cargo_work = UserCargoWork.new(:user_id => user.id, :cargo_id => cargo.id, :estado => 0) 

       respond_to do |format|
	 if @user_cargo_work.save
	   format.html { redirect_to user_path(user), flash: { success:  'El cargo fue guardado exitosamente.'} }
	 else
	   format.html { redirect_to user_path(user), flash: { danger:  'El cargo no pudo ser guardado correctamente, informacion no validad.'} }
	 end
       end
   end

  # este metodo se encarga de eliminar la relacion entre el usuario y el cargo asignado
  def destroyUserCargo
    user = User.find(params[:user])
    # se validan los datos que llegan por get para verificar si existen los parametros	
    if !user 
      format.html { redirect_to user_path(user), flash: { danger:  'El usuario relacionado no existe.'} }
    end 

    @user_cargo_work.destroy
    respond_to do |format|
      format.html { redirect_to user_path(user), flash: { success:  'La relacion del cargo fue eliminada correctamente.'} }
    end
  end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_user_cargo_work
      @user_cargo_work = UserCargoWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_cargo_work_params
      params.require(:user_cargo_work).permit(:user_id, :cargo_id, :estado, :monday, :tuesday, :wednesday, :thursday, :friday)
    end
end
