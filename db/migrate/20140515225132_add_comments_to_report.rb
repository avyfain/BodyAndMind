class AddCommentsToReport < ActiveRecord::Migration
  def change
    add_column :reports, :comments, :string
  end
end
