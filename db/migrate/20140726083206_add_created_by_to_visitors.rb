class AddCreatedByToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :created_by, :string
  end
end
