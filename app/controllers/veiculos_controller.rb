class VeiculosController < ApplicationController
  before_action :set_veiculo, only: [:show, :update, :destroy]

  # GET /veiculos
  def index
    @veiculos = Veiculo.all

    render json: @veiculos
  end

  # GET /veiculos/1
  def show
    render json: @veiculo
  end

  # POST /veiculos
  def create
    @veiculo = Veiculo.new(veiculo_params)

    if @veiculo.save
      render json: @veiculo, status: :created, location: @veiculo
    else
      render json: @veiculo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /veiculos/1
  def update
    if @veiculo.update(veiculo_params)
      render json: @veiculo
    else
      render json: @veiculo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /veiculos/1
  def destroy
    @veiculo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def veiculo_params
      params.require(:veiculo).permit(:placa, :idrota, :idtransportadora)
    end
end
