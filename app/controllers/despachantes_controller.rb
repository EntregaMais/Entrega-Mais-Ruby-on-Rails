class DespachantesController < ApplicationController
  before_action :set_despachante, only: [:show, :update, :destroy]

  # GET /despachantes
  def index
    @despachantes = Despachante.all

    render json: @despachantes
  end

  # GET /despachantes/1
  def show
    render json: @despachante
  end

  # POST /despachantes
  def create
    @despachante = Despachante.new(despachante_params)

    if @despachante.save
      render json: @despachante, status: :created, location: @despachante
    else
      render json: @despachante.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /despachantes/1
  def update
    if @despachante.update(despachante_params)
      render json: @despachante
    else
      render json: @despachante.errors, status: :unprocessable_entity
    end
  end

  # GET /despachantes/:nmdespachante
  def findByNmdespachante
    @despachantes = Despachante.where(nmdespachante: params[:nmdespachante])

    render json: @despachantes
  end

  # GET /despachantes/idtransportadora/:idtransportadora
  def findByIdtransportadora
    @despachantes = Sespachante.where(idtransportadora: params[:idtransportadora])

    render json: @despachantes
  end

  # GET /despachante/ok
  def test
    render plain: 'ok'
  end

  # DELETE /despachantes/1
  def destroy
    @despachante.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despachante
      @despachante = Despachante.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def despachante_params
      params.require(:despachante).permit(:nmdespachante, :idtransportadora)
    end
end
