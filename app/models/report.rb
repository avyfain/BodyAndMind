class Report < ActiveRecord::Base
	attr_accessible :sleep, :wake, :excercise, :energy, :mood, :weight, :stress, :weather, :temperature, :geolocation

  def to_hash
    sleep_seconds = self.wake - self.sleep
    @h = self.attributes
    @h.delete("wake")
    @h["sleep"] = sleep_seconds/3600
    return @h
  end

end
