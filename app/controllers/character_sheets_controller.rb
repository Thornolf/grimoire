class CharacterSheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character_sheet, only: [ :show, :edit, :update, :destroy, :add_condition, :remove_condition ]
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
    # Load default skills for display
    @skills = Skill.where(default: true)
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
      save_character_skills(@character_sheet)

      if @mission
        redirect_to mission_path(@mission), notice: "Character Sheet successfully created."
      else
        redirect_to character_sheets_path, notice: "Character Sheet successfully created."
      end
    else
      @skills = Skill.where(default: true)
      render :new
    end
  end

  # Edit action
  def edit
    @skills = Skill.where(default: true)
  end

  # Update action for both standalone and mission-based character sheets
  def update
    if @character_sheet.update(character_sheet_params)
      # Save skills from form input
      save_character_skills(@character_sheet)

      if @mission
        redirect_to [ @mission, @character_sheet ], notice: "Character sheet was successfully updated."
      else
        redirect_to @character_sheet, notice: "Character sheet was successfully updated."
      end
    else
      @skills = Skill.where(default: true) # Re-load skills if update fails
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

  def add_condition
    condition = Condition.find(params[:condition_id])

    if condition
      @character_sheet.conditions << condition
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("character-sheet-#{@character_sheet.id}", partial: "missions/character_sheet_details", locals: { character_sheet: @character_sheet, mission: @character_sheet.mission }) }
        format.html { redirect_to mission_character_sheet_path(@character_sheet.mission, @character_sheet), notice: "Condition added successfully." }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("character-sheet-#{@character_sheet.id}", partial: "missions/character_sheet_details", locals: { character_sheet: @character_sheet, mission: @character_sheet.mission }), alert: "Invalid condition." }
        format.html { redirect_to mission_character_sheet_path(@character_sheet.mission, @character_sheet), alert: "Invalid condition." }
      end
    end
  end

  def remove_condition
    condition = Condition.find(params[:condition_id])

    if @character_sheet.conditions.delete(condition) # This removes the association, not the actual record
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("character-sheet-#{@character_sheet.id}", partial: "missions/character_sheet_details", locals: { character_sheet: @character_sheet, mission: @character_sheet.mission })
        end
        format.html { redirect_to mission_character_sheet_path(@character_sheet.mission, @character_sheet), notice: "Condition removed successfully." }
      end
    else
      respond_to do |format|
        format.html { redirect_to mission_character_sheet_path(@character_sheet.mission, @character_sheet), alert: "Failed to remove condition." }
      end
    end
  end

  private

  # Set the character sheet depending on whether it's mission-based or standalone
  def set_character_sheet
    character_sheet_id = params[:id]

    if @mission
      @character_sheet = @mission.character_sheets.find(character_sheet_id)
    else
      @character_sheet = CharacterSheet.find(character_sheet_id)
    end
  end

  # Set the mission if mission_id is present
  def set_mission
    @mission = Mission.find_by(id: params[:mission_id]) if params[:mission_id]
  end

  def character_sheet_params
    params.require(:character_sheet).permit(
      :name,
      :mission_id,
      :strength,
      :constitution,
      :dexterity,
      :intelligence,
      :power,
      :charisma,
      :hit_points,
      :willpower_points,
      :sanity,
      :breaking_point,
      :luck,
      :employer,
      :gender,
      :age,
      :nationality,
      :motivation,
      :profession,
      :rank,
      :background,
      :occupation_history,
      bounds_attributes: [ :id, :name, :description, :score, :_destroy ]
    )
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

  def save_character_skills(character_sheet)
    params["character_sheet"]["skills"].each do |skill_id, custom_percentage|
      character_sheet_skill = CharacterSkill.find_or_initialize_by(
        character_sheet: character_sheet,
        skill_id: skill_id
      )
      character_sheet_skill.update(custom_percentage: custom_percentage)
    end
  end
end
