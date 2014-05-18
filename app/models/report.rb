class Report < ActiveRecord::Base
	attr_accessible :sleep, :wake, :excercise, :energy, :mood, :weight, :stress, :weather, :temperature, :geolocation

  def to_hash
    sleep_seconds = self.wake - self.sleep
    @h = self.attributes
    @h.delete("wake")
    @h["sleep"] = sleep_seconds/3600
    return @h
  end

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["created_at","sleep","exercise","energy","mood","weight","stress"]
      all.each do |report|
        csv << [report.created_at, report.sleep, report.excercise, report.energy,report.mood,report.weight,report.stress]
      end
    end
  end

end
