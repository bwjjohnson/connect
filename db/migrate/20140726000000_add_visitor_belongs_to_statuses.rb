class AddVisitorBelongsToStatuses < ActiveRecord::Migration
  def change    
    add_reference :visitors, :status, index: true, :default => 0, :null => false
  end
end