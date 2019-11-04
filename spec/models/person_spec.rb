require 'rails_helper'

RSpec.describe Person, type: :model do
  describe '.import' do 
    it 'should update person count' do
      file = fixture_file_upload(Rails.root.join('spec', 'test.csv'), 'text/csv')
      expect{Person.import(file)}.to change(Person, :count).by(1)
    end
  end

  describe '#validate a person' do
    it 'should validate presense of first_name' do
      expect(Person.new species: 'Human', gender: 'male').not_to be_valid
    end
    
    it 'should validate presense of species' do
      expect(Person.new first_name: 'test', gender: 'male').not_to be_valid
    end

    it 'should validate presense of gender' do
      expect(Person.new first_name: 'test', species: 'Human').not_to be_valid
    end

    it 'should validate gender' do
      expect{Person.new first_name: 'test', species: 'Human', gender: 'test'}.to raise_error(ArgumentError).with_message("'test' is not a valid gender")
    end
  end

  describe '#instance methods' do
    before do 
      @person = FactoryGirl.create :person
    end
    it 'should get full name of a person' do
      expect(@person.full_name).to eq "Roy Zheng"
    end

    it 'should display locations' do
      expect(@person.display_locations).to eq "Adelaide"
    end

    it 'should display affiliations' do
      expect(@person.display_affiliations).to eq "MI6"
    end

    it 'should populate name' do
      @person.populate_name("Tom Cruise")
      expect(@person.first_name).to eq "Tom"
      expect(@person.last_name).to eq "Cruise"
    end

    it 'should populate gender' do
      @person.populate_gender("f")
      expect(@person.gender).to eq "female"
    end

    it 'should populate locations' do
      expect{@person.populate_locations("Sydney")}.to change(Location, :count).by(1)
      expect(@person.display_locations.include?("Sydney")).to eq true
    end

    it 'should populate affiliations' do
      expect{@person.populate_affiliations("CIA")}.to change(Affiliation, :count).by(1)
      expect(@person.display_affiliations.include?("CIA")).to eq true
    end
  end
end
