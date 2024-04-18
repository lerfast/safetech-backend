class AuditsController < ApplicationController
    before_action :authorize_request
  
    def index
      @audits = Audit.all
      render json: @audits
    end
  
    def show
      render json: @audit
    end
  
    def create
      @audit = Audit.new(audit_params)
      if @audit.save
        render json: @audit, status: :created, location: @audit
      else
        render json: @audit.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @audit.update(audit_params)
        render json: @audit
      else
        render json: @audit.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @audit.destroy
      head :no_content
    end
  
    private
      def set_audit
        @audit = Audit.find(params[:id])
      end
  
      def audit_params
        params.require(:audit).permit(:date, :details, :auditor)
      end
  end
 

