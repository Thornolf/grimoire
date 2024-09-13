class HandoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mission
  before_action :set_handout, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_game_master!, except: [ :index, :show ]

  def index
    @handouts = @mission.handouts
  end

  def show
  end

  def new
    @handout = @mission.handouts.build
  end

  def create
    @handout = @mission.handouts.build(handout_params)
    if @handout.save
      redirect_to [ @mission, @handout ], notice: "Handout was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @handout.update(handout_params)
      redirect_to [ @mission, @handout ], notice: "Handout was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @handout.destroy
    redirect_to mission_handouts_path(@mission), notice: "Handout was successfully destroyed."
  end

  private

  def set_mission
    @mission = Mission.find(params[:mission_id])
  end

  def set_handout
    @handout = @mission.handouts.find(params[:id])
  end

  def handout_params
    params.require(:handout).permit(:title, :content)
  end

  def authorize_game_master!
    unless current_user.game_master? && current_user == @mission.user
      redirect_to mission_handouts_path(@mission), alert: "You are not authorized to perform this action."
    end
  end
end
