

class User
    attr_accessor :email, :age
    @@all_users = Array.new
    
    def initialize(email_to_save, age)
        @email = email_to_save
        @age = age
        @@all_users << self
    end

    def self.all
        return @@all_users
    end

    def self.find_by_email(email)
        @@all_users.each do |i|
            if i.email == email
                return puts "Voici l'âge du user : #{i.age}ans."
            end
        end
    end    
end

#binding.pry