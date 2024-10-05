class MissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mission, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_game_master!, except: [ :index, :show ]

  def index
    @missions = current_user.missions
  end

def show
  @mission = Mission.find_by(id: params[:id])

  if current_user.game_master?
    # Eager load character_sheets with character_skills and skills to avoid N+1 query issues
    @character_sheets = @mission.character_sheets.includes(character_skills: :skill)
  else
    @character_sheet = current_user.character_sheets.includes(character_skills: :skill).find_by(mission_id: @mission.id)
  end
end

  def new
    @mission = current_user.missions.build
  end

  def create
    @mission = current_user.missions.build(mission_params)
    MissionsUser.create!(user: current_user, mission: @mission, role: current_user.role)

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

  def add_character_sheet
    @mission = Mission.find(params[:mission_id])
    @character_sheet = CharacterSheet.find(params[:character_sheet_id])

    if @character_sheet && @mission
      @mission.character_sheets << @character_sheet
      MissionsUser.create!(user: @character_sheet.user, mission: @mission, role: @character_sheet.user.role)

      flash[:success] = "Character sheet successfully added to mission."
    else
      flash[:error] = "There was a problem adding the character sheet."
    end

    # Redirect back to the mission show page
    redirect_to mission_path(@mission)
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

  def remove_handout
    @mission = Mission.find(params[:mission_id])
    @handout = Handout.find(params[:handout_id])

    # Remove the handout from the mission's handouts
    if @mission.handouts.delete(@handout)
      flash[:success] = "Handout successfully removed from the mission."
    else
      flash[:error] = "There was a problem removing the handout."
    end

    # Redirect back to the mission show page
    redirect_to mission_path(@mission)
  end

  def remove_character_sheet
    @mission = Mission.find(params[:mission_id])
    @character_sheet = CharacterSheet.find(params[:character_sheet_id])

    if @mission && @character_sheet
      @mission.character_sheets.delete(@character_sheet)

      if @character_sheet.kind == "player"
        MissionsUser.find_by(user: @character_sheet.user, mission: @mission, role: @character_sheet.user.role).destroy
      end

      flash[:success] = "CharacterSheet successfully removed from the mission."
    else
      flash[:error] = "There was a problem removing the character_sheet."
    end

    # Redirect back to the mission show page
    redirect_to mission_path(@mission)
  end

  def add_sound
    @mission = Mission.find(params[:mission_id])
    @sound = Sound.find(params[:sound_id])
    @mission.sounds << @sound unless @mission.sounds.include?(@sound)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.append("sounds", partial: "missions/sound", locals: { sound: @sound }) }
      format.html { redirect_to @mission }
    end
  end

  def remove_sound
    @mission = Mission.find(params[:mission_id])
    @sound = @mission.sounds.find(params[:sound_id])
    @mission.sounds.delete(@sound)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("sound_#{@sound.id}") }
      format.html { redirect_to @mission }
    end
  end

  def add_inventory_item
    @mission = Mission.find(params[:mission_id])
    @character_sheet = CharacterSheet.find(params[:character_sheet_id])
    @item = Item.find(params[:item_id])
    @inventory = Inventory.create(item_id: @item.id, character_sheet_id: @character_sheet.id)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.append("inventories", partial: "inventories/inventory", locals: { character_sheet: @character_sheet }) }
      format.html { redirect_to @mission }
    end
  end

  def remove_inventory_item
    @mission = Mission.find(params[:mission_id])
    @character_sheet = CharacterSheet.find(params[:character_sheet_id])
    @inventory = @character_sheet.inventories.find(params[:inventory_id])
    @character_sheet.inventories.delete(@inventory)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("inventory_#{@inventory.id}") }
      format.html { redirect_to @mission }
    end
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
