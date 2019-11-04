require 'rails_helper'

RSpec.describe Affiliation, type: :model do
  describe ".get_affiliations" do
    it "should create a new record if does not exist" do
      expect{Affiliation.get_affiliation('test')}.to change(Affiliation, :count).by(1)
    end
  end
end
