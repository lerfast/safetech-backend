class SystemDocumentsController < ApplicationController
    before_action :set_system_document, only: %i[show update destroy]
  
    def index
      @system_documents = SystemDocument.all
      render json: @system_documents
    end
  
    def show
      render json: @system_document
    end
  
    def create
      @system_document = SystemDocument.new(system_document_params)
      if @system_document.save
        render json: @system_document, status: :created
      else
        render json: @system_document.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @system_document.update(system_document_params)
        render json: @system_document
      else
        render json: @system_document.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @system_document.destroy
      head :no_content
    end
  
    private
  
    def set_system_document
      @system_document = SystemDocument.find(params[:id])
    end
  
    def system_document_params
      params.require(:system_document).permit(:title, :content, :document_type, :user_id)
    end
  end
  