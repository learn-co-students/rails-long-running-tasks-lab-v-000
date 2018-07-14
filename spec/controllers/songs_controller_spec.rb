require 'rails_helper'

Capybara.ignore_hidden_elements = false

RSpec.describe SongsController do
  describe "file upload" do
    before do
      Song.destroy_all
      Artist.destroy_all
    end

    it "uploads and processes a file" do
      post :upload, file: fixture_file_upload('songs.csv', 'text/csv')
      expect(Song.all.count).to eq 13
      expect(Artist.all.count).to eq 6
    end
  end
end
