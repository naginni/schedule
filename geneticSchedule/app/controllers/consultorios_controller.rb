class ConsultoriosController < ApplicationController
  before_action :set_consultorio, only: [:show, :edit, :update, :destroy]

  def index
     @consultorios = Consultorio.all
  end

  def show
  end

  def new
     @consultorio = Consultorio.new
  end

  def edit
  end 

  def create
    @consultorio = Consultorio.new(consultorio_params)

    respond_to do |format|
      if @consultorio.save
        format.html { redirect_to @consultorio, notice: 'Consultorio was successfully created.' }
        format.json { render :show, status: :created, location: @consultorio }
      else
        format.html { render :new }
        format.json { render json: @consultorio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @consultorio.update(consultorio_params)
        format.html { redirect_to @consultorio, notice: 'Consultorio was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultorio }
      else
        format.html { render :edit }
        format.json { render json: @consultorio.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @consultorio.destroy
    respond_to do |format|
      format.html { redirect_to consultorio_path(user), flash: { success:  'El consultorio fue eliminada correctamente.'} }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultorio
      @consultorio = Consultorio.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def consultorio_params
      params.require(:consultorio).permit(:nombre, :numero)
    end
end
