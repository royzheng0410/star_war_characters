class CreatePersonLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :person_locations do |t|
      t.integer  :person_id
      t.integer  :location_id
      t.timestamps
    end
  end
end
