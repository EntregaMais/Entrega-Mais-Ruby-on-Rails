class TrajetosController < ApplicationController
  before_action :set_trajeto, only: [:show, :update, :destroy]

  # GET /trajetos
  def index
    @trajetos = Trajeto.all

    render json: @trajetos
  end

  # GET /trajetos/1
  def show
    render json: @trajeto
  end

  # POST /trajetos
  def create
    @trajeto = Trajeto.new(trajeto_params)

    if @trajeto.save
      render json: @trajeto, status: :created, location: @trajeto
    else
      render json: @trajeto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trajetos/1
  def update
    if @trajeto.update(trajeto_params)
      render json: @trajeto
    else
      render json: @trajeto.errors, status: :unprocessable_entity
    end
  end

  # GET /trajetos/nmtrajeto/:nmtrajeto
  def findByNmtrajeto
    @trajetos = Trajeto.where(nmtrajeto: params[:nmtrajeto])

    render json: @trajetos
  end

  # GET /trajetos/idtransportadora/:idtransportadora
  def findByIdtransportadora
    @trajetos = Trajeto.where(idtransportadora: params[:idtransportadora])

    render json: @trajetos
  end

  # DELETE /trajetos/1
  def destroy
    @trajeto.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trajeto
      @trajeto = Trajeto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trajeto_params
      params.require(:trajeto).permit(:nmtrajeto, :dstrajeto, :idtransportadora)
    end
end
