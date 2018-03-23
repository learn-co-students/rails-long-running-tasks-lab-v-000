class Artist < ActiveRecord::Base
  has_many :songs
  require 'csv'
end
