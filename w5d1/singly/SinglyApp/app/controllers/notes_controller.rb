class NotesController < ApplicationController
  before_action :redirect_to_login_if_signed_out

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id

    if @note.save
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if current_user.try(:id) != @note.user_id
      render text: "Nice try, but you can't delete that note.", status: 403
      return
    end
    @note.destroy
    redirect_to track_url(@note.track_id)
  end

  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
