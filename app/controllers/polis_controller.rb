class PolisController < ApplicationController
  before_action :set_poli, only: [:show, :update, :destroy]

  # GET /polis
  def index
    @polis = Poli.all

    render json: @polis
  end

  # GET /polis/1
  def show
    render json: @poli
  end

  # POST /polis
  def create
    @poli = Poli.new(poli_params)

    if @poli.save
      render json: @poli, status: :created, location: @poli
    else
      render json: @poli.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /polis/1
  def update
    if @poli.update(poli_params)
      render json: @poli
    else
      render json: @poli.errors, status: :unprocessable_entity
    end
  end

  
  # GET /polis/idapi/:idapi
  def findByIdapi
    @polis = Poli.where(idapi: params[:idapi])

    render json: @polis
  end

  # GET /polis/nmcidade/:nmcidade
  def findByNmcidade
    @polis = Poli.where(nmcidade: params[:nmcidade])

    render json: @polis
  end

  # GET /polis/idtrajeto/:idtrajeto
  def findByIdtrajeto
    @polis = Poli.where(idtrajeto: params[:idtrajeto])

    render json: @polis
  end

  # GET /poli/ok
  def test
    render plain: 'ok'
  end

  # DELETE /polis/1
  def destroy
    @poli.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poli
      @poli = Poli.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poli_params
      params.require(:poli).permit(:idapi, :nmcidade, :idtrajeto)
    end
end
