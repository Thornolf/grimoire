class CharacterSheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character_sheet, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    if current_user.game_master?
      @character_sheets = @mission.character_sheets
    else
      @character_sheets = current_user.character_sheets.where(mission: @mission)
    end
  end

  def show
  end

  def new
    @character_sheet = current_user.character_sheets.build(mission: @mission)
  end

  def create
    @character_sheet = current_user.character_sheets.build(character_sheet_params)
    if @character_sheet.save
      redirect_to [ @mission, @character_sheet ], notice: "Character sheet was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @character_sheet.update(character_sheet_params)
      redirect_to [ @mission, @character_sheet ], notice: "Character sheet was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @character_sheet.destroy
    redirect_to mission_character_sheets_path(@mission), notice: "Character sheet was successfully destroyed."
  end

  private

  def set_character_sheet
    @character_sheet = @mission.character_sheets.find(params[:id])
  end

  def character_sheet_params
    params.require(:character_sheet).permit(:name, :data, :mission_id)
  end

  def authorize_user!
    unless current_user == @character_sheet.user || current_user.game_master?
      redirect_to mission_character_sheets_path(@mission), alert: "You are not authorized to perform this action."
    end
  end
end
