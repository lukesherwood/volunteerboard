class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :event, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.string :description
      t.boolean :assigned

      t.timestamps
    end
  end
end
