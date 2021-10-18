

class Event
    attr_accessor :start_date, :duration, :title, :attendees

    def initialize(start_date, duration, title = "", attendees = [])
       @start_date = Time.parse(start_date)
       @duration = duration.to_i
       @title = title
       @attendees = attendees
       @@duration_in_seconds = self.duration * 60
       @@end_time = @start_date + @@duration_in_seconds
    end

    def postpone_24h
        @start_date += 86400
        puts "the new start date is #{@start_date}."
    end

    def end_date
        puts "The ending time is #{@@end_time}."
    end

    def is_past?
        current_time = Time.new
        if @start_date < current_time
            puts "The event has already started / is probably already over."
        else
            puts "The event has not yet started."
        end
    end

    def is_future?
        current_time = Time.new
        if @start_date > current_time
            puts "The event has not yet started."
        else
            puts "The event has already started / is probably already over."
        end
    end

    def is_soon?
        current_time = Time.new
        if current_time - @start_date <= 1800
            puts "It's starting soon !"
        end
    end

    def to_s
        puts "> Titre : #{title} "
        puts "> Date de début : #{start_date.strftime('%m/%d/%Y %H:%M %p')} "
        puts "> Durée : #{duration} minutes "
        print "> Invités : #{attendees.join(', ')}."

    end
end

#binding.pry