# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
365.times do |n|
    @date = Time.now - n.day
    @r = lambda{rand(1..10)}
    @moods = ["Afraid", "Tense", "Depressed", "Disappointed", "Proud", "Cheerful", "Happy", "Loving", "Humiliated", "Sad"]
    @report = Report.create!(
      sleep: @r[],
      wake: @r[],
      excercise: @r[],
      energy: @r[],
      mood:@moods.sample,
      weight:160+@r[],
      stress:@r[],
      weather: nil,
      temperature: nil,
      geolocation: nil
    )
    @report.update_attribute :created_at, @date
    @report.update_attribute :updated_at, @date
end

