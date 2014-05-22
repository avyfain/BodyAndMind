class ChangeSleepFromDateTimeToInt < ActiveRecord::Migration
  def change
    add_column(:reports, :sleep_tmp, :integer)
    Report.all.each do |r|
    	r.sleep_tmp = r.sleep.hour
    end
    remove_column(:reports, :sleep)
    rename_column(:reports, :sleep_tmp, :sleep)
  end
end
