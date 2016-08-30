class Candidate < ApplicationRecord
  mount_uploader :image, PlaceUploader

  #TODO
  #MIN/MAX latitude
  #ENFORCE CHAR LIMIT
end
