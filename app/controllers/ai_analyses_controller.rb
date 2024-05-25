class AIAnalysesController < ApplicationController
    before_action :set_ai_analysis, only: %i[show update destroy]
  
    def index
      @ai_analyses = AIAnalysis.all
      render json: @ai_analyses
    end
  
    def show
      render json: @ai_analysis
    end
  
    def create
      @ai_analysis = AIAnalysis.new(ai_analysis_params)
      if @ai_analysis.save
        # Llamar al script de Python para procesar el análisis de datos
        process_ai_analysis(@ai_analysis)
        render json: @ai_analysis, status: :created
      else
        render json: @ai_analysis.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @ai_analysis.update(ai_analysis_params)
        render json: @ai_analysis
      else
        render json: @ai_analysis.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @ai_analysis.destroy
      head :no_content
    end
  
    private
  
    def set_ai_analysis
      @ai_analysis = AIAnalysis.find(params[:id])
    end
  
    def ai_analysis_params
      params.require(:ai_analysis).permit(:title, :description, :input_data, :status, :user_id)
    end
  
    def process_ai_analysis(ai_analysis)
      PyCall.import_module('sys').path.append('path/to/your/python/scripts')
  
      analysis_script = PyCall.import_module('analysis_script')
      result = analysis_script.run_analysis(ai_analysis.input_data)
  
      ai_analysis.update(output_data: result, status: 'completed')
    end
  end
  