class AddColumnsToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :work_type, :string
    add_column :jobs, :location, :string
    add_column :jobs, :commitment, :string
  end
end
