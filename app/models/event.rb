class Event < ActiveRecord::Base

  validates :date, presence: true
  # validate :date_future 
  validates  :title, presence: true
  validates  :title, uniqueness: true
  validates :organizer_name, presence: true 
  validates_format_of :organizer_email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

def date_future 
if :date < Date.today
  errors.add(:date, "cannot be in the past") 
  end
end

  def validation_errors
    errors.add(:title, "Event title already taken")
    errors.add(:date, "Date cannot be empty")
    errors.add(:organizer_name, "Organizer name cannot be empty")
    errors.add(:organizer_email, "invalid organizer email")

  end

end



#

