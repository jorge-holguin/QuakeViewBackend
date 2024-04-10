class FeatureSerializer < ActiveModel::Serializer
  attributes :id, :external_id, :magnitude, :place, :time, :tsunami, :mag_type, :title, :longitude, :latitude
end
