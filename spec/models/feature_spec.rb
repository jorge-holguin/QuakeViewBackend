require 'rails_helper'

RSpec.describe Feature, type: :model do
  it "is valid with valid attributes" do
    feature = Feature.new(title: "Valid Title", place: "Valid Place")
    expect(feature).to be_valid
  end

  it "is not valid without a title" do
    feature = Feature.new(title: nil)
    expect(feature).not_to be_valid
  end
end
