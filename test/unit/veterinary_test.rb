require 'test_helper'

class VeterinaryTest < ActiveSupport::TestCase

  def setup
    @vet = veterinaries(:sean)
  end

  test "01 name is present" do
    vet = Veterinary.new
    assert !vet.save, "Name is required"
  end

  test "02 name is not longer than 35 characters" do
    vet = veterinaries(:name_too_long)
    assert vet.invalid?, "Name is too long"
  end

  test "03 zip cannot be more than 5 characters" do
    @vet.zip = "123456"
    assert @vet.invalid?, "Zip too long"
  end

  test "04 zip cannot be less than 5 characters" do
    @vet.zip = "1234"
    assert @vet.invalid?, "Zip too short"
  end

  test "05 zip cannot be alphanumeric" do
    @vet.zip = "abcde"
    assert @vet.invalid?, "Zip not numeric"
  end

  test "06 years in practice cannot be greater than 100" do
    @vet.date_graduated = Time.now.year - 101
    assert @vet.invalid?, "Must be <= 100>"
  end

  test "07 years in practice cannot be less than 1" do
    @vet.date_graduated = Time.now.year
    assert @vet.invalid?, "Must be >= 1"
  end

  test "08 years in practice between 1 and 100" do
    @vet.date_graduated = Time.now.year - Random.rand(1..100)
    assert @vet.valid?
  end

  test "09 years in practice equals years in practice" do
    assert_equal(@vet.years_in_practice, Time.now.year - @vet.date_graduated)
  end
  test "10 get current_appointments" do
    puts "\n"
    @vet.current_appointments.each do |appt|
      puts appt.inspect
    end
    assert_equal(3, @vet.current_appointments.length)
  end

  test "11 determine an available time" do
    assert @vet.is_available?("2013-07-15 10:30:00")
  end

  test "12 determine an unavailable time" do
    assert !@vet.is_available?("2013-06-15 10:30:00")
  end
end
