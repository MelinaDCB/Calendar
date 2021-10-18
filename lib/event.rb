require 'pry'
require 'time'

class Event
    attr_accessor :start_date, :duration, :title, :attendees

    def initialize(sd_to_save, duration_to_save, title_to_save, attendees_to_save)
       @start_date = sd_to_save
       @duration = duration_to_save
       @title = title_to_save
       @attendees = attendees_to_save
    end

    def self.postpone_24h
        @start_date += 86400
    end
end

binding.pry