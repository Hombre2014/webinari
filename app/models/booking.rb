class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :workshop

  after_create :update_workshop_sits_count

  def update_workshop_sits_count
    workshop.update(remaining_sits: workshop.total_sits - number_of_tickets)
  end
end
