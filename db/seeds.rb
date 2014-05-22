# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
365.times do |n|
    @r = lambda{rand(1..10)}
    @ySlashN = lambda{["Yes", "No"].sample}
    @moods = ["Afraid", "Tense", "Depressed", "Disappointed", "Proud", "Cheerful", "Happy", "Loving", "Humiliated", "Sad"]
    @report = Report.create!(
      sleep: @r[],
      excercise: @ySlashN[],
      energy: @r[],
      mood:@moods.sample,
      weight:160+@r[],
      stress:@r[],
      weather: nil,
      temperature: nil,
      geolocation: nil
    )
    @report.update_attribute :created_at, n.days.ago
    @report.update_attribute :updated_at, n.days.ago
    @report.save
end

