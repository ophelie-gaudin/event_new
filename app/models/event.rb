class Event < ApplicationRecord

  has_many :attendances
  has_many :participants, through: :attendances
  belongs_to :admin, class_name: "User"

  validates :start_date, 
    presence: true
  
  
  validate :start_date_cannot_be_in_the_past

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end


  validates :duration, 
    presence: true,
    numericality: { :greater_than => 0 }
  #   format: { with: /\A\d*[05]z/,
  #     message: "only allows multiples of 5" }
  validate :is_five_multiple

  def is_five_multiple
    if (duration.to_s.end_with?("0")) || (duration.to_s.end_with?("5"))
    else
      errors.add(:duration, "must be multiple of 5")
    end
  end

  validates :title,
    presence: true,
    length: { minimum: 5, maximum: 140 }


  validates :description,
  presence: true,
  length: { minimum: 20, maximum: 1000 }


  validates :price,
    presence: true,
    numericality: { greater_than: 1, less_than_or_equal_to: 1000 }


  validates :location,
    presence: true
    

    
end
