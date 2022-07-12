class TeamsCreatorsController < ApplicationController
  before_action :set_teams_creator, only: %i[ show edit update destroy ]

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
    respond_to do |format|
      if @teams_creator.save
        # Create the respective registrations based on user input
        @user_inputs = @teams_creator.user_input.split("\n")
        @user_inputs.each do |input|
          fields = input.split(" ")
          name = fields[0]
          date = fields[1]
          day = date.split("/")[0]
          month = date.split("/")[1]
          begin
            formatted_date = Date.parse("2022-" + month + "-" + day)
          rescue ArgumentError
            nil
          end

          group = fields[2]

          Team.create(name: name, registration_date: formatted_date, group: group)
        end
        format.html { redirect_to teams_path, notice: "Teams are successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teams_creator.errors, status: :unprocessable_entity }
      end
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
