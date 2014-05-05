class AddFieldsToReports < ActiveRecord::Migration
  def change
  	add_column :reports, :sleep, 		:datetime
  	add_column :reports, :wake, 		:datetime
  	add_column :reports, :excercise, 	:integer
  	add_column :reports, :energy, 		:integer
  	add_column :reports, :mood, 		:string
  	add_column :reports, :weight, 		:float
  	add_column :reports, :stress, 		:integer
  	add_column :reports, :weather,		:string
  	add_column :reports, :temperature,	:integer
	add_column :reports, :geolocation, 	:string
  end
end
