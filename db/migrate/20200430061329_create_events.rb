class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :organisation, null: false, foreign_key: true
      t.datetime :date
      t.string :name
      t.string :location
      t.text :information

      t.timestamps
    end
  end
end
