class AddEventIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :event_id, :integer
  end
end
