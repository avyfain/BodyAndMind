class ChangeSleepFromDateTimeToInt < ActiveRecord::Migration
  def change
    change_column(:reports, :sleep, :integer)
  end
end
