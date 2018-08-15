class SongsController < ApplicationController

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
    CSV.foreach(params[:songs].path, headers: true) do |song|
      artist = Artist.find_or_create_by(name: song[1])
      Song.find_or_create_by(title: song[0], artist_id: artist.id) 
    end 
    redirect_to songs_path
  end

  # create_table "artists", force: :cascade do |t|
  #   t.string   "name"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end

  # create_table "songs", force: :cascade do |t|
  #   t.string   "title"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.integer  "artist_id"
  # end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

