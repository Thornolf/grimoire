class NotesController < ApplicationController
  before_action :set_mission
  before_action :set_user
  before_action :set_note

  # GET /missions/:mission_id/notes
  def index
    @notes = @mission.notes.where(user: @user)
  end

  # POST /missions/:mission_id/notes
  def create
    @note = @mission.notes.new(note_params)
    @note.user = @user

    if @note.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to mission_notes_path(@mission), notice: "Note was successfully created." }
      end
    else
      format.html { render :index }
    end
  end

  def edit
    @note = current_user.notes.find_or_initialize_by(mission: @mission)
  end

  def update
    if @note.update(note_params)
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.update("note-form", partial: "notes/form", locals: { note: @note, mission: @mission }) }
        format.html { redirect_to mission_path(@mission), notice: "Note saved." }
      end
    else
      render :edit
    end
  end

  private

  def set_note
    @note = current_user.notes.find_or_initialize_by(mission: @mission)
  end

  def set_mission
    @mission = Mission.find(params[:mission_id])
  end

  def set_user
    @user = current_user
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
