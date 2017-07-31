class TracksController < ApplicationController
  before_action :redirect_to_login_if_signed_out

  def show
    @track = Track.find(params[:id])
  end

  def new
    @all_albums = Album.all
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to new_track_url
    end
  end

  def edit
    @track = Track.find(params[:id])
    @all_albums = Album.all
  end

  def update
    @track = Track.find(params[:id])

    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      redirect_to edit_track_url
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to bands_url
  end

  private
  def track_params
    params.require(:track).permit(:title, :feature, :lyrics, :album_id)
  end

end
