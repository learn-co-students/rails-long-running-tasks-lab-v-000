require 'pry'
class SongsController < ApplicationController
  require 'csv'

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  def upload
    # Song Clean,ARTIST CLEAN,Release Year,COMBINED,First?,Year?,PlayCount,F*G
    # song_name,artist_name,release_year ....
    CSV.foreach(params[:file].path, headers: true) do |song|
      temp_song = Song.create(title: song[0]);
      temp_artist = Artist.find_or_create_by(name: song[1]);
      temp_song.artist = temp_artist;
    end
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

  # def upload
  #   CSV.foreach(params[:leads].path, headers: true) do |lead|
  #     Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
  #   end
  #   redirect_to customers_path
  # end