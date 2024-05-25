class FormsController < ApplicationController
    before_action :set_form, only: %i[show update destroy]
  
    def index
      @forms = Form.all
      render json: @forms
    end
  
    def show
      render json: @form
    end
  
    def create
      @form = Form.new(form_params)
      if @form.save
        render json: @form, status: :created
      else
        render json: @form.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @form.update(form_params)
        render json: @form
      else
        render json: @form.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @form.destroy
      head :no_content
    end
  
    private
  
    def set_form
      @form = Form.find(params[:id])
    end
  
    def form_params
      params.require(:form).permit(:title, :description, :form_data, :user_id)
    end
  end
  