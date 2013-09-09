class Event < ActiveRecord::Base

  # validates :date, presence: true, numericality: { :greater_than => Date.today  }
  validates :date, presence: {message: "Date required"}

  validate :date_future

  validates  :title, presence: {message: "title cannot be blank"  }

  validates  :title, uniqueness: {message: "event title already taken" }

  validates :organizer_name, presence: {message: "organizer name cannot be empty" }

  validates :organizer_email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, message: "organizer name cannot be empty" }

  def date_future 
    if date.present? && date < Date.today
      errors.add(:date, "cannot be in the past") 
    end
  end


end



#

