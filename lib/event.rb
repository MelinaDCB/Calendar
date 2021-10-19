

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
    
    def age_analysis
        age_array = [] #On initialise un array qui va contenir les âges de tous les participants à un évènement
        average = 0 #On initialise une variable pour calculer la moyenne d'âge à l'évènement
    
        @attendees.each do |attendee| #On parcourt tous les participants (objets de type User)
          age_array << attendee.age #leur âge est stocké dans l'array des âges
          average = average + attendee.age #leur âge est additionné pour préparer le calcul de la moyenne
        end
    
        average = average / @attendees.length #on divise la somme des âges pour avoir la moyenne
    
        puts "Voici les âges des participants :"
        puts age_array.join(", ")
        puts "La moyenne d'âge est de #{average} ans"
    end
end

class WorkEvent < Event
    def is_event_acceptable?
  
        if @attendees.length > 3 || @duration > 60
        puts "Cette réunion ne respecte pas nos bonnes pratiques !"
        return false
        else
        puts "Cette réunion est OK."
        return true
        end
    end
end

