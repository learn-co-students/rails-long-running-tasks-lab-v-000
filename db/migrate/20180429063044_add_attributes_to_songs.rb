class AddAttributesToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :release_year, :integer
    add_column :songs, :combined, :string
    add_column :songs, :first, :integer
    add_column :songs, :year, :integer
    add_column :songs, :playcount, :integer
    add_column :songs, :fxg, :integer
  end
end
