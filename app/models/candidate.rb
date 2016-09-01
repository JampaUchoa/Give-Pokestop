class Candidate < ApplicationRecord
  mount_uploader :image, PlaceUploader

  validates :name, :image, :latitude, :longitude, :user_id, presence: true

  validates :latitude , numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  validates :name, length: { in: 2..30 }
  validates :description, length: { in: 0..140 }

  #TODO
  #ENFORCE CHAR LIMIT

end
