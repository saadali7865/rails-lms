class LendBook < ApplicationRecord

  belongs_to :user
  belongs_to :book

  enum :status, [:pending, :approved, :rejected, :returned, :delayed]

  validates :days, presence: true
  validates :status, presence: true
end
