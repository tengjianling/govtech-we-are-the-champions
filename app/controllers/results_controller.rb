class ResultsController < ApplicationController
  before_action :set_result
  
  def index
    
  end

  def create
    @results = Result.new(result_params)

    respond_to do |format|
      if @result.save
        # format.html { redirect_to matches_creator_url(@matches_creator), notice: "Matches creator was successfully created." }
        # format.json { render :show, status: :created, location: @matches_creator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matches_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_results
      @results = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:name, :points, :goals, :alternative_points, :group)
    end
end
