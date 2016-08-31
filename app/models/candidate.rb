class Candidate < ApplicationRecord
  mount_uploader :image, PlaceUploader
  validates :name, :name, :description, :image, :latitude, :longitude, presence: true


  #TODO
  #MIN/MAX latitude
  #ENFORCE CHAR LIMIT
end
