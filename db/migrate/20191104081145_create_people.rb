class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :species
      t.string   :gender
      t.string   :weapon
      t.string   :vehicle
      t.timestamps
    end

    add_index :people, :first_name
    add_index :people, :last_name
    add_index :people, :weapon
    add_index :people, :vehicle
    add_index :people, :species
    add_index :people, :gender
  end
end
