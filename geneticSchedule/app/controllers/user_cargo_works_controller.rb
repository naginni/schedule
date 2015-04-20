class UserCargoWorksController < ApplicationController
  before_action :set_medico_cargo, only: [:edit, :update]

  def index
     @medico_cargos = UserCargoWork.where(:estado => false).where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10)
     @medico_cargos_list = UserCargoWork.where(:estado => true).where(:user_id => current_user.id).paginate(:page => params[:page], :per_page => 10)
  end 

  def show
  end 

  def new
  end 

  def edit
  end 

  def update
    respond_to do |format|
      if @medico_cargo.update(medico_cargo_params)
        format.html { redirect_to user_cargo_works_path, notice: 'Cargo was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @medico_cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medico_cargo
      @medico_cargo = UserCargoWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medico_cargo_params
      params.require(:user_cargo_work).permit(:user_id, :cargo_id, :estado, :monday, :tuesday, :wednesday, :thursday, :friday)
    end
end
