class Customer < ActiveRecord::Base
  attr_accessible :name, :pets_attributes

  has_many :pets, dependent: :destroy
  has_many :appointments, through: :pets

  validates :name, presence: true

  accepts_nested_attributes_for :pets
end
