  class Feature < ApplicationRecord
    has_many :comments, dependent: :destroy

    # Validaciones
    validates :mag, :place, :time, :longitude, :latitude, presence: true
    validates :mag, numericality: { greater_than_or_equal_to: -1.0, less_than_or_equal_to: 10.0 }
    validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
    validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  end

