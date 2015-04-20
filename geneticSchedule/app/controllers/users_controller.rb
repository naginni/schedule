class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
     @users = User.paginate(:page => params[:page], :per_page => 10)
  end

   def new
     @user = User.new
   end

   def show
      # Cargos no relacionados con el usuario
     @cargos = Cargo.where.not(id: UserCargoWork.select(:cargo_id).where(user_id: params[:id])).paginate(:page => params[:page], :per_page => 5).order('cups ASC') 
      # Cargos relacionados con el usuario
     @user_cargo_works = UserCargoWork.where(user_id: params[:id]).paginate(:page => params[:page], :per_page => 5)
   end

  def edit
  end 

   def create
     @user = User.new(user_params)
     if @user.save
       redirect_to root_url, :notice => "Signed up!"
     else
       render "new"
     end
   end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.  
   def user_params
      params.require(:user).permit(:cc, :nombre, :apellido, :perfil, :telefono, :especialidad, :direccion, :email, :password, :password_confirmation)
   end
end
