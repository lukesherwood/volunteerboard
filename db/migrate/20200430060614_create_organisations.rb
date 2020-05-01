class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :location
      t.text :mission
      t.integer :owner_id
      t.timestamps
    end
  end
end
