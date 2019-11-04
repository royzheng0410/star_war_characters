class CreatePersonAffiliations < ActiveRecord::Migration[5.1]
  def change
    create_table :person_affiliations do |t|
      t.integer  :person_id
      t.integer  :affiliation_id
      t.timestamps
    end
  end
end
