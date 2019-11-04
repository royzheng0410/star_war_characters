FactoryGirl.define do
  factory :person do
    first_name 'Roy'
    last_name 'Zheng'
    gender 'male'
    species 'human'
    weapon 'gun'
    vehicle 'car'
    after(:create) do |person|
      person.locations << (FactoryGirl.create :location, name: 'Adelaide')
      person.affiliations << (FactoryGirl.create :affiliation, name: 'MI6')
    end
  end
end
