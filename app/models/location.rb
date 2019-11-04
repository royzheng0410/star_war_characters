class Location < ApplicationRecord
  has_many :person_locations
  has_many :people, through: :person_locations

  def self.get_location(location)
    where(name: location).first_or_create
  end
end
