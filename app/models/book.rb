class Book < ApplicationRecord
  scope :active, -> { where(is_active: true) }

  belongs_to :user

  enum :category, [:horror, :action, :romantic]

  validates :title, presence: true
  validates :category, presence: true
end
