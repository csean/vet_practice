class Pet < ActiveRecord::Base
  BREEDS = %w[dog cat bird]

  has_many :appointments
  belongs_to :customer

  attr_accessible :dob, :breed, :name, :species, :weight, :customer_id

  validates :name, :breed, :customer_id, presence: true
  validates :name, :breed, length: { maximum: 35 }
  validates :species, inclusion: { in: %w(dog cat bird) }
  # because parrots can live a long time
  # I chose to use dob because age is a calculated field
  validates :dob, date: { before: Proc.new { Time.now },
                          after: Proc.new { Time.now - 100.years } }
  validates :weight, numericality: { greater_than_or_equal_to: 1 }, allow_blank: true

  def next_appointment
    appts = self.appointments.current

    if appts.count >= 1
      appts[0]
    else
      "N/A"
    end
  end

  def age
    (DateTime.now - dob).to_i/365
  end

end
