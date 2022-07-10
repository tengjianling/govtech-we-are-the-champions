class RegistrationsCreatorsController < ApplicationController
  before_action :set_registrations_creator, only: %i[ show edit update destroy ]


  def destroy_them_all
    Registration.destroy_all
    Match.destroy_all
    redirect_to root
  end

  # GET /registrations_creators or /registrations_creators.json
  def index
    @registrations_creators = RegistrationsCreator.all
  end

  # GET /registrations_creators/1 or /registrations_creators/1.json
  def show
  end

  # GET /registrations_creators/new
  def new
    @registrations_creator = RegistrationsCreator.new
  end

  # GET /registrations_creators/1/edit
  def edit
  end

  # POST /registrations_creators or /registrations_creators.json
  def create
    @registrations_creator = RegistrationsCreator.new(registrations_creator_params)
    
    # Create the respective registrations based on user input
    @user_inputs = @registrations_creator.user_input.split("\n")
    @user_inputs.each do |input|
      fields = input.split(" ")
      name = fields[0]
      date = fields[1]
      group = fields[2]

      Registration.create(name: name, date: date, group: group)
    end

    respond_to do |format|
      if @registrations_creator.save
        format.html { redirect_to registrations_creator_url(@registrations_creator), notice: "Registrations creator was successfully created." }
        format.json { render :show, status: :created, location: @registrations_creator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registrations_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations_creators/1 or /registrations_creators/1.json
  def update
    respond_to do |format|
      if @registrations_creator.update(registrations_creator_params)
        format.html { redirect_to registrations_creator_url(@registrations_creator), notice: "Registrations creator was successfully updated." }
        format.json { render :show, status: :ok, location: @registrations_creator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registrations_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations_creators/1 or /registrations_creators/1.json
  def destroy
    @registrations_creator.destroy

    respond_to do |format|
      format.html { redirect_to registrations_creators_url, notice: "Registrations creator was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registrations_creator
      @registrations_creator = RegistrationsCreator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registrations_creator_params
      params.require(:registrations_creator).permit(:user_input)
    end
end
