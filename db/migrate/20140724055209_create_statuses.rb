class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :description
      t.integer :order
      t.boolean :is_final

      t.timestamps
    end
  end
end
