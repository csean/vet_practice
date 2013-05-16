class Veterinary < ActiveRecord::Base

  has_many :appointments

  attr_accessible :address, :city, :date_graduated, :name, :school, :state, :zip

  validates :name, presence: true
  validates :name, length: { maximum: 35 }
  validates :zip,  length: { is: 5 }, allow_blank: true
  validates :zip, format: { with: /^[0-9]{5}$/ }
  validates :date_graduated, numericality: { only_integer: true,
                                             greater_than_or_equal_to: Proc.new { Time.now.year - 100 },
                                             less_than_or_equal_to: Proc.new { Time.now.year - 1 } }

  def years_in_practice
    Time.now.year - date_graduated
  end

  def current_appointments
    self.appointments.current
  end

  def is_available?(time)
    result = self.appointments.availability(time)

    if result.length >= 1
      false
    else
      true
    end
  end

end
