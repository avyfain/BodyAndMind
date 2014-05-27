class AddUserToReport < ActiveRecord::Migration
  def change
    add_column :reports, :email, :string
    Report.all.each do |r|
      if not r.email.present? 
        r.email = "clemer19@gmail.com"
      end
    end
  end
end
