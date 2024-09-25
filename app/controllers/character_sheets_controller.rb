class CharacterSheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character_sheet, only: [ :show, :edit, :update, :destroy ]
  before_action :set_mission, only: [ :index, :show, :new, :create, :edit, :update, :destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  # Index action for both standalone and mission-based character sheets
  def index
    if @mission
      @character_sheets = @mission.character_sheets
    else
      @character_sheets = current_user.game_master? ? CharacterSheet.all : current_user.character_sheets
    end
  end

  # Show action for both standalone and mission-based character sheets
  def show
    if @mission
      @character_sheet = @mission.character_sheets.find(params[:id])
    else
      @character_sheet = CharacterSheet.find(params[:id])
    end
  end

  # New action for both standalone and mission-based character sheets
  def new
    if @mission
      @character_sheet = @mission.character_sheets.build
    else
      @character_sheet = CharacterSheet.new
    end
  end

  # Create action for both standalone and mission-based character sheets
  def create
    if @mission
      @character_sheet = @mission.character_sheets.build(character_sheet_params)
    else
      @character_sheet = CharacterSheet.new(character_sheet_params)
    end
    @character_sheet.user = current_user

    if @character_sheet.save
      if @mission
        redirect_to mission_path(@mission), notice: "Character Sheet successfully created."
      else
        redirect_to character_sheets_path, notice: "Character Sheet successfully created."
      end
    else
      render :new
    end
  end

  # Edit action
  def edit
  end

  # Update action for both standalone and mission-based character sheets
  def update
    if @character_sheet.update(character_sheet_params)
      if @mission
        redirect_to [ @mission, @character_sheet ], notice: "Character sheet was successfully updated."
      else
        redirect_to @character_sheet, notice: "Character sheet was successfully updated."
      end
    else
      render :edit
    end
  end

  # Destroy action for both standalone and mission-based character sheets
  def destroy
    @character_sheet.destroy
    if @mission
      redirect_to mission_character_sheets_path(@mission), notice: "Character sheet was successfully destroyed."
    else
      redirect_to character_sheets_path, notice: "Character sheet was successfully destroyed."
    end
  end

  private

  # Set the character sheet depending on whether it's mission-based or standalone
  def set_character_sheet
    if @mission
      @character_sheet = @mission.character_sheets.find(params[:id])
    else
      @character_sheet = CharacterSheet.find(params[:id])
    end
  end

  # Set the mission if mission_id is present
  def set_mission
    @mission = Mission.find_by(id: params[:mission_id]) if params[:mission_id]
  end

  def character_sheet_params
    params
      .require(:character_sheet)
      .permit(:name, :mission_id, :strength, :constitution, :dexterity, :intelligence, :power, :charisma, :hit_points, :willpower_points, :sanity, :breaking_point, :luck)
  end

  def authorize_user!
    unless current_user == @character_sheet.user || current_user.game_master?
      if @mission
        redirect_to mission_character_sheets_path(@mission), alert: "You are not authorized to perform this action."
      else
        redirect_to character_sheets_path, alert: "You are not authorized to perform this action."
      end
    end
  end
end
