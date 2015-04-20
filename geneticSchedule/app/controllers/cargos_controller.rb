class CargosController < ApplicationController
  before_action :set_cargo, only: [:show, :edit, :update]

  def index
     @cargos = Cargo.paginate(:page => params[:page], :per_page => 10)
  end

  # Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')

  def show
  end

  def new
     @cargo = Cargo.new
  end

  def edit
  end 

  def create
    @cargo = Cargo.new(cargo_params)

    respond_to do |format|
      if @cargo.save
        format.html { redirect_to @cargo, notice: 'Cargo was successfully created.' }
        format.json { render :show, status: :created, location: @cargo }
      else
        format.html { render :new }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cargo.update(cargo_params)
        format.html { redirect_to @cargo, notice: 'Cargo was successfully updated.' }
        format.json { render :show, status: :ok, location: @cargo }
      else
        format.html { render :edit }
        format.json { render json: @cargo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def cargo_params
      params.require(:cargo).permit(:nombre, :cups)
    end
end
