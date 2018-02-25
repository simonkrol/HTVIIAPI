class Ride < ApplicationRecord
  belongs_to :user
  validates :startL, presence: {message: 'startL must be unique'}
  validates :endL, presence:{message: 'endL must be unique'}
  validates :startT, presence:{message: 'startT must be unique'}
  validates :endT, presence:{message: 'endT must be unique'}
end
