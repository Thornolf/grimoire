class NotesController < ApplicationController
  before_action :set_mission
  before_action :set_user

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

  def update; end

  private

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
