class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if take_ride_ok?
      "Thanks for riding the #{self.attraction.name}!"
    end
  end




  def take_ride_ok?
     if  tickets? && height?
      true
     else
     false
     end
  end

  def tickets?
      if self.user.tickets >= self.attraction.tickets
         true
      else
        "You do not have enough tickets to ride the #{self.attraction.name}."
      end
  end


def height?
        if self.user.height >= self.attraction.min_height
           true
        else
           "You are not tall enough to ride the #{self.attraction.name}."
        end
end

  def update_user
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_ticket_count = self.user.tickets - self.attraction.tickets
    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_ticket_count
    )
  end
end
