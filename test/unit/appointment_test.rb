require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase

  test "01 appointment time cannot be in the past" do
    appointment = Appointment.new(appointment_time: "2012-01-01 10:00:00",
                                  reason_for_visit: "annual checkup",
                                  requires_reminder: false,
                                  pet_id: pets(:baron),
                                  veterinary_id: veterinaries(:sean))
    assert !appointment.save, "Appointment cannot occur in the past"
  end

  test "02 pet is required" do
    appointment = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                                  reason_for_visit: "annual checkup",
                                  requires_reminder: false,
                                  veterinary_id: veterinaries(:sean))
    assert !appointment.save, "Pet is required"
  end

  test "03 vet is required" do
    appointment = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                                  reason_for_visit: "annual checkup",
                                  requires_reminder: false,
                                  pet_id: pets(:baron))
    assert !appointment.save, "Vet is required"
  end

  test "04 reason for visit is required" do
    appointment = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                                  requires_reminder: false,
                                  pet_id: pets(:baron),
                                  veterinary_id: veterinaries(:sean))
    assert !appointment.save, "Reason for visit is required"
  end

  test "05 reminder is required" do
    appointment = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                                  reason_for_visit: "annual checkup",
                                  pet_id: pets(:baron),
                                  veterinary_id: veterinaries(:sean))
    assert !appointment.save, "Reminder is required"
  end

  test "06 vet cannot be overbooked" do
    a1 = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                                  reason_for_visit: "annual checkup",
                                  requires_reminder: false,
                                  pet_id: pets(:baron),
                                  veterinary_id: veterinaries(:sean))
    a1.save

    a2 = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                         reason_for_visit: "annual checkup",
                         requires_reminder: false,
                         pet_id: pets(:gunner),
                         veterinary_id: veterinaries(:sean))

    assert !a2.save, "Vet cannot be overbooked"
  end

  test "07 vet cannot be overbooked" do
    a1 = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                         reason_for_visit: "annual checkup",
                         requires_reminder: false,
                         pet_id: pets(:baron),
                         veterinary_id: veterinaries(:sean))
    a1.save

    a2 = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                         reason_for_visit: "annual checkup",
                         requires_reminder: false,
                         pet_id: pets(:baron),
                         veterinary_id: veterinaries(:bob))

    assert !a2.save, "Pet cannot be overbooked"
  end

  test "08 all vets should be free" do
    assert_equal(4, Appointment.vets_available("2013-09-15 10:00:00").count)
  end

  test "09 one vet should not be free" do
    assert_equal(3, Appointment.vets_available("2013-07-15 10:30:00").count)
  end

  test "10 customer is required" do
    appointment = Appointment.new(appointment_time: "2014-01-01 10:00:00",
                                  requires_reminder: false,
                                  reason_for_visit: "annual checkup",
                                  pet_id: pets(:baron),
                                  veterinary_id: veterinaries(:sean))
    assert !appointment.save, "Customer is required"
  end
end
