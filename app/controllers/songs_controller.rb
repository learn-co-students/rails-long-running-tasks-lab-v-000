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
    #Song Clean,ARTIST CLEAN,Release Year,COMBINED,First?,Year?,PlayCount,F*G
    #Caught Up in You,.38 Special,1982,Caught Up in You by .38 Special,1,1,82,82
    #Fantasy Girl,.38 Special,,Fantasy Girl by .38 Special,1,0,3,0
    #raise(params.inspect)

    CSV.foreach(params[:file].path, headers: true) do |song|
      artist = Artist.find_or_create_by(name: song[1])
      song = Song.find_or_create_by(title: song[0])
      song.artist = artist
      song.save
    end

    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

