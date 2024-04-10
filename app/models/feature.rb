module Api
  class Feature < ApplicationRecord
    has_many :comments, dependent: :destroy
  end
end
