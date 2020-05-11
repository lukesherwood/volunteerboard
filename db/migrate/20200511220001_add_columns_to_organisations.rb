class AddColumnsToOrganisations < ActiveRecord::Migration[6.0]
  def change
    add_column :organisations, :category, :string
    add_column :organisations, :website, :string
    add_column :organisations, :contact_info, :string
  end
end
