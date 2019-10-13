class Marker < ApplicationRecord
  validates :title, :lat, :lng, presence: true
end
