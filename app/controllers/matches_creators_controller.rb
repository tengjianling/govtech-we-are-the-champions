class MatchesCreatorsController < ApplicationController
  before_action :set_matches_creator, only: %i[ show edit update destroy ]

  # GET /matches_creators or /matches_creators.json
  def index
    @matches_creators = MatchesCreator.all
  end

  # GET /matches_creators/1 or /matches_creators/1.json
  def show
  end

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
      first_team_id = Registration.find_by(name: first_team).id
      second_team = fields[1]
      second_team_id = Registration.find_by(name: second_team).id
      first_team_score = fields[2]
      second_team_score = fields[3]

      Match.create(registration_id: first_team_id, opponent_id: second_team_id, registration_score: first_team_score, opponent_score: second_team_score)
    end


    respond_to do |format|
      if @matches_creator.save
        format.html { redirect_to matches_creator_url(@matches_creator), notice: "Matches creator was successfully created." }
        format.json { render :show, status: :created, location: @matches_creator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matches_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches_creators/1 or /matches_creators/1.json
  def update
    respond_to do |format|
      if @matches_creator.update(matches_creator_params)
        format.html { redirect_to matches_creator_url(@matches_creator), notice: "Matches creator was successfully updated." }
        format.json { render :show, status: :ok, location: @matches_creator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @matches_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches_creators/1 or /matches_creators/1.json
  def destroy
    @matches_creator.destroy

    respond_to do |format|
      format.html { redirect_to matches_creators_url, notice: "Matches creator was successfully destroyed." }
      format.json { head :no_content }
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
