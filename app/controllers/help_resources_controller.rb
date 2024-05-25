class HelpResourcesController < ApplicationController
  before_action :set_help_resource, only: %i[show update destroy]

  def index
    @help_resources = HelpResource.all
    render json: @help_resources
  end

  def show
    render json: @help_resource
  end

  def create
    @help_resource = HelpResource.new(help_resource_params)
    if @help_resource.save
      render json: @help_resource, status: :created
    else
      render json: @help_resource.errors, status: :unprocessable_entity
    end
  end

  def update
    if @help_resource.update(help_resource_params)
      render json: @help_resource
    else
      render json: @help_resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @help_resource.destroy
    head :no_content
  end

  private

  def set_help_resource
    @help_resource = HelpResource.find(params[:id])
  end

  def help_resource_params
    params.require(:help_resource).permit(:title, :content, :help_type, :user_id)
  end
end
