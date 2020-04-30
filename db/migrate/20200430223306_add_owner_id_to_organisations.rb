class AddOwnerIdToOrganisations < ActiveRecord::Migration[6.0]
  def change
    add_column :organisations, :owner_id, :integer
  end
end
