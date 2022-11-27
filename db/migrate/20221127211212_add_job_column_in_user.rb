class AddJobColumnInUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :jobs, :integer, array: true, default: []
  end
end
