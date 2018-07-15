require 'rails_helper'

RSpec.describe SongsController do
  describe "file upload" do
    before do
      Song.destroy_all
      Artist.destroy_all
    end

    it "uploads and processes a file" do
      expect(Song.all.count).to eq 0
      expect(Artist.all.count).to eq 0
    end
  end
end
