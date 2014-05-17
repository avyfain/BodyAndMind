class ChangeExcerciseToStringInReport < ActiveRecord::Migration
  def change
    change_column(:reports, :excercise, :string)
  end
end
