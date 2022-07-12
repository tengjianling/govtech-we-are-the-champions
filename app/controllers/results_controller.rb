class ResultsController < ApplicationController
  # before_action :set_results
  
  def index
    Result.delete_all
    @points = Result.get_points_hash
    @alternative_points = Result.get_alternative_points_hash
    @goals = Result.get_number_of_goals_hash

    Team.all.each do |t|
      if !Result.exists?(name: t.name)
        Result.create(
          name: t.name, 
          points: @points[t.id], 
          goals: @goals[t.id], 
          alternative_points: @alternative_points[t.id],
          group: t.group,
          registration_date: t.registration_date
        )
   
      end
    end
    @groups = Result.distinct.pluck(:group)
    @sorted_results = Result.order(group: :asc, points: :desc, goals: :desc, alternative_points: :desc, registration_date: :asc)
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
    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:name, :points, :goals, :alternative_points, :group, :registration_date)
    end
end
