class RemoveWakeFromReport < ActiveRecord::Migration
  def change
  	remove_column(:reports, :wake)
  end
end
