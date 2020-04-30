class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :location
      t.text :mission

      t.timestamps
    end
  end
end
