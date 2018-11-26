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
    # Song Clean0,ARTIST CLEAN1,Release Year2,COMBINED3,First?4,Year?5,PlayCount6,F*G7
    # binding.pry
    CSV.foreach(params["file"].path, headers: true) do |file|
      Song.create(title: file[0], artist_name: file[1])
      # EmailAddress,GivenName,Surname
   #   Customer.create(email: lead[0], first_name: lead[1], last_name: lead[2])
   end
   redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
