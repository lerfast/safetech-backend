class CapasController < ApplicationController
  before_action :set_capa, only: %i[show update destroy]

  def index
    @capas = Capa.all
    render json: @capas
  end

  def show
    render json: @capa
  end

  def create
    @capa = Capa.new(capa_params)
    if @capa.save
      render json: @capa, status: :created
    else
      render json: @capa.errors, status: :unprocessable_entity
    end
  end

  def update
    if @capa.update(capa_params)
      render json: @capa
    else
      render json: @capa.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @capa.destroy
    head :no_content
  end

  private

  def set_capa
    @capa = Capa.find(params[:id])
  end

  def capa_params
    params.require(:capa).permit(:action_description, :responsible_person_id, :start_date, :end_date, :priority, :status, :incident_id)
  end
end
