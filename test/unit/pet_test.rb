require 'test_helper'

class PetTest < ActiveSupport::TestCase
  def setup
    @pet = pets(:baron)
  end

  test "01 name is present" do
    pet = Pet.new
    assert !pet.save, "Name is required"
  end

  test "02 name is not longer than 35 characters" do
    pet = pets(:name_too_long)
    assert pet.invalid?, "Name is too long"
  end

  test "03 species is a dog, cat, or bird" do
    @pet.species = "Ferret"
    assert @pet.invalid?, "Must be dog, cat, or bird"
  end

  test "04 breed is present" do
    pet = pets(:fido)
    assert pet.invalid?, "Breed is required"
  end

  test "05 breed is not longer than 35 characters" do
    pet = pets(:breed_too_long)
    assert pet.invalid?, "Breed is too long"
  end

  test "06 dob is a date" do
    @pet.dob = "abcde"
    assert @pet.invalid?, "DOB must be a date"
  end

  test "07 weight is a number" do
    @pet.weight = "a"
    assert @pet.invalid?, "Weight must be a number"
  end

  test "08 weight must be >= 1" do
    @pet.weight = -1
    assert @pet.invalid?, "Weight must be >= 1"
  end

  test "09 weight can be blank" do
    @pet.weight = nil
    assert @pet.valid?
  end

  test "10 pet must have an owner" do
    pet = pets(:no_customer)
    assert pet.invalid?, "Pet must have an owner"
  end

end
