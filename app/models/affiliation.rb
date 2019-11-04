class Affiliation < ApplicationRecord
  has_many :person_affiliations
  has_many :people, through: :person_affiliations

  def self.get_affiliation(affiliation)
    where(name: affiliation).first_or_create
  end
end
