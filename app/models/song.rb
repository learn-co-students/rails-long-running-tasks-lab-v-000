class Song < ActiveRecord::Base
  belongs_to :artist
  require 'csv'

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def self.upload(params)
    CSV.foreach(params[:file].path, headers: true) do |song|
      s = Song.create(title: song[0])
      s.artist = Artist.find_or_create_by(name: song[1])
    end
  end

end
