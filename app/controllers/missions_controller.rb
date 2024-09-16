class MissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mission, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_game_master!, except: [ :index, :show ]

  def index
    @missions = Mission.all
  end

  def show
    @mission = Mission.find_by(id: params[:id])
  end

  def new
    @mission = current_user.missions.build
  end

  def create
    @mission = current_user.missions.build(mission_params)
    if @mission.save
      redirect_to @mission, notice: "Mission was successfully created."
    else
      render :new
    end
  end

  def edit
    authorize_game_master!
  end

  def update
    if @mission.update(mission_params)
      redirect_to @mission, notice: "Mission was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @mission.destroy
    redirect_to missions_url, notice: "Mission was successfully destroyed."
  end

  def add_handout
    @mission = Mission.find(params[:mission_id])
    @handout = Handout.find(params[:handout_id])

    # Add the handout to the mission
    if @mission.handouts << @handout
      flash[:success] = "Handout successfully added to mission."
    else
      flash[:error] = "There was a problem adding the handout."
    end

    # Redirect back to the mission show page
    redirect_to mission_path(@mission)
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:title, :description)
  end

  def authorize_game_master!
    unless current_user.game_master?
      redirect_to missions_path, alert: "You are not authorized to perform this action."
    end
  end
end
