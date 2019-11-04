require 'csv'
class Person < ApplicationRecord

  validates :first_name, :species, :gender, presence: true
  enum gender: {:male => 'male', :female => 'female', :other => 'other'}

  VALID_MALE = ["Male", "m", "M", "MALE", "male"]
  VALID_FEMALE = ["Female", "f", "F", "FAMEL", "famel"]
  VALID_OTHER = ["Other", "o", "O", "OTHER", "other"]

  has_many :person_locations
  has_many :locations, through: :person_locations

  has_many :person_affiliations
  has_many :affiliations, through: :person_affiliations

  ransacker :full_name do |parent|
    Arel::Nodes::NamedFunction.new('CONCAT_WS', [
      Arel::Nodes.build_quoted(' '), parent.table[:first_name], parent.table[:last_name]
    ])
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      next unless row["Affiliations"].present?
      person = Person.new
      person.populate_name(row["Name"])
      person.populate_gender(row["Gender"])
      person.species = row["Species"]
      person.weapon = row["Weapon"]
      person.vehicle = row["Vehicle"]
      if person.valid?
        person.save!
        person.populate_locations(row["Location"])
        person.populate_affiliations(row["Affiliations"])
      end
    end
  end

  def full_name
    first_name + ' ' + last_name 
  end

  def display_locations
    locations.pluck(:name).join(", ")
  end

  def display_affiliations
    affiliations.pluck(:name).join(", ")
  end

  def populate_name(name)
    split_name = name.split(' ')
    self.first_name = split_name.first.titleize
    self.last_name = split_name.drop(1).join(" ").titleize
  end

  def populate_gender(gender)
    self.gender = "male" if VALID_MALE.include?(gender)
    self.gender = "female" if VALID_FEMALE.include?(gender)
    self.gender = "other" if VALID_OTHER.include?(gender)
  end

  def populate_locations(location)
    locations = location.split(", ")
    locations.each do |location|
      location = Location.get_location(location.titleize)
      self.locations << location
    end
  end

  def populate_affiliations(affiliation)
    affiliations = affiliation.split(", ")
    affiliations.each do |affiliation|
      affiliation = Affiliation.get_affiliation(affiliation)
      self.affiliations << affiliation
    end
  end
end
