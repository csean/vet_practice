class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :veterinary

  default_scope order('appointment_time ASC')
  scope :current, lambda { where("appointment_time > ?", Time.now ) }
  scope :availability, lambda { |time| where("appointment_time = ?", time) }

  before_save :save_appointment_time

  attr_accessor :customer_id

  attr_accessible :reason_for_visit, :requires_reminder, :appointment_time,
                  :pet_id, :veterinary_id, :customer_id

  validates :appointment_time,
            date: { after: Proc.new {Time.now},
            message: "cannot occur in the past" }
  validates :pet_id, :veterinary_id, :customer_id, :reason_for_visit, presence: true
  validates :requires_reminder, inclusion: { in: [true, false] }

  validates :veterinary_id, uniqueness: { scope: :appointment_time }
  validates :pet_id, uniqueness: { scope: :appointment_time }

  def self.vets_available(time)
    free = []
    Veterinary.all.each do |vet|
      free.push(vet) if vet.is_available?(time)
    end
    free
  end

  def save_appointment_time
    #self.appointment_time = Date.parse("#{date} #{time}")
    # this way we have a chunk of time to block off for the appointment

    self.appointment_end_time = self.appointment_time + 30.minutes
  end

end
