class TeamsCreatorsController < ApplicationController
  before_action :set_teams_creator, only: %i[ show edit update destroy ]

  # GET /teams_creators or /teams_creators.json
  def index
    @teams_creators = TeamsCreator.all
  end

  # GET /teams_creators/1 or /teams_creators/1.json
  def show
  end

  # GET /teams_creators/new
  def new
    @teams_creator = TeamsCreator.new
  end

  # GET /teams_creators/1/edit
  def edit
  end

  # POST /teams_creators or /teams_creators.json
  def create
    @teams_creator = TeamsCreator.new(teams_creator_params)


    # Create the respective registrations based on user input
    @user_inputs = @teams_creator.user_input.split("\n")
    @user_inputs.each do |input|
      fields = input.split(" ")
      name = fields[0]
      date = fields[1]
      group = fields[2]

      Team.create(name: name, registration_date: date, group: group)
    end


    respond_to do |format|
      if @teams_creator.save
        format.html { redirect_to teams_creator_url(@teams_creator), notice: "Teams creator was successfully created." }
        format.json { render :show, status: :created, location: @teams_creator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teams_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams_creators/1 or /teams_creators/1.json
  def update
    respond_to do |format|
      if @teams_creator.update(teams_creator_params)
        format.html { redirect_to teams_creator_url(@teams_creator), notice: "Teams creator was successfully updated." }
        format.json { render :show, status: :ok, location: @teams_creator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teams_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams_creators/1 or /teams_creators/1.json
  def destroy
    @teams_creator.destroy

    respond_to do |format|
      format.html { redirect_to teams_creators_url, notice: "Teams creator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teams_creator
      @teams_creator = TeamsCreator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teams_creator_params
      params.require(:teams_creator).permit(:user_input)
    end
end
