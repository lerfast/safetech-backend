class AuditItemsController < ApplicationController
    before_action :set_audit_item, only: [:show, :update, :destroy]
  
    def index
      @audit_items = AuditItem.all
      render json: @audit_items
    end
  
    def show
      render json: @audit_item
    end
  
    def create
      @audit_item = AuditItem.new(audit_item_params)
      if @audit_item.save
        render json: @audit_item, status: :created, location: @audit_item
      else
        render json: @audit_item.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @audit_item.update(audit_item_params)
        render json: @audit_item
      else
        render json: @audit_item.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @audit_item.destroy
      head :no_content
    end
  
    private
      def set_audit_item
        @audit_item = AuditItem.find(params[:id])
      end
  
      def audit_item_params
        params.require(:audit_item).permit(:audit_id, :description, :compliance_status)
      end
  end
  