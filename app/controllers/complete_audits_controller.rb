class CompleteAuditsController < ApplicationController
    before_action :set_complete_audit, only: %i[show update destroy]
  
    def index
      @complete_audits = CompleteAudit.all
      render json: @complete_audits
    end
  
    def show
      render json: @complete_audit
    end
  
    def create
      @complete_audit = CompleteAudit.new(complete_audit_params)
      if @complete_audit.save
        render json: @complete_audit, status: :created
      else
        render json: @complete_audit.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @complete_audit.update(complete_audit_params)
        render json: @complete_audit
      else
        render json: @complete_audit.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @complete_audit.destroy
      head :no_content
    end
  
    private
  
    def set_complete_audit
      @complete_audit = CompleteAudit.find(params[:id])
    end
  
    def complete_audit_params
      params.require(:complete_audit).permit(:scope, :specific_questions, :audit_details, :corrective_actions, :audit_type, :user_id)
    end
  end
  