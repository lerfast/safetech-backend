class ExamplesController < ApplicationController
    def index
      @examples = Example.all
      @python_output = `python ml_script.py`
    puts @python_output
    end
  
    def show
      @example = Example.find(params[:id])
    end
  
    def new
      @example = Example.new
    end
  
    def create
      @example = Example.new(example_params)
      if @example.save
        redirect_to @example, notice: 'Example was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @example = Example.find(params[:id])
    end
  
    def update
      @example = Example.find(params[:id])
      if @example.update(example_params)
        redirect_to @example, notice: 'Example was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @example = Example.find(params[:id])
      @example.destroy
      redirect_to examples_url, notice: 'Example was successfully destroyed.'
    end
  
    private
      def example_params
        params.require(:example).permit(:name, :description)
      end
  end
  