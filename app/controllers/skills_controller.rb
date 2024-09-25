class SkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_game_master!
  before_action :set_skill, only: [ :edit, :update, :destroy ]

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skills_path, notice: "Skill was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to skills_path, notice: "Skill was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path, notice: "Skill was successfully deleted."
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :base_percentage, :category, :default)
  end

  def authorize_game_master!
    unless current_user.game_master?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
