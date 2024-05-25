class QrScansController < ApplicationController
  before_action :set_qr_scan, only: %i[show update destroy]

  def index
    @qr_scans = QrScan.all
    render json: @qr_scans
  end

  def show
    render json: @qr_scan
  end

  def create
    @qr_scan = QrScan.new(qr_scan_params)
    if @qr_scan.save
      render json: @qr_scan, status: :created
    else
      render json: @qr_scan.errors, status: :unprocessable_entity
    end
  end

  def update
    if @qr_scan.update(qr_scan_params)
      render json: @qr_scan
    else
      render json: @qr_scan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @qr_scan.destroy
    head :no_content
  end

  private

  def set_qr_scan
    @qr_scan = QrScan.find(params[:id])
  end

  def qr_scan_params
    params.require(:qr_scan).permit(:data, :scanned_at, :user_id)
  end
end
