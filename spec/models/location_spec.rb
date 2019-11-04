require 'rails_helper'

RSpec.describe Location, type: :model do
  describe ".get_affiliations" do
    it "should create a new record if does not exist" do
      expect{Location.get_location('test')}.to change(Location, :count).by(1)
    end
  end
end
