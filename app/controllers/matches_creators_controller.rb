class MatchesCreatorsController < ApplicationController
  before_action :set_matches_creator, only: %i[ show edit update destroy ]

  # GET /matches_creators/new
  def new
    @matches_creator = MatchesCreator.new
  end

  # GET /matches_creators/1/edit
  def edit
  end

  # POST /matches_creators or /matches_creators.json
  def create
    @matches_creator = MatchesCreator.new(matches_creator_params)

    # Create the respective registrations based on user input
    @user_inputs = @matches_creator.user_input.split("\n")
    @user_inputs.each do |input|
      fields = input.split(" ")
      first_team = fields[0]
      first_team_id = Team.find_by(name: first_team).id.to_i
      second_team = fields[1]
      second_team_id = Team.find_by(name: second_team).id.to_i
      first_team_score = fields[2]
      second_team_score = fields[3]

      Match.create(team1_id: first_team_id, team2_id: second_team_id, team1_score: first_team_score, team2_score: second_team_score)
    end


    respond_to do |format|
      if @matches_creator.save
        format.html { redirect_to matches_path, notice: "Matches were successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matches_creator.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matches_creator
      @matches_creator = MatchesCreator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def matches_creator_params
      params.require(:matches_creator).permit(:user_input)
    end
end
