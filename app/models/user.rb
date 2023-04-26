class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books

  has_one_attached :profile_image
  enum :user_type, [:author, :librarian, :consumer], default: :consumer

  validates :name, presence: true
  validates :national_id, presence: true
  validates :user_type, presence: true
  validates :profile_image, presence: true

  validate :profile_image_type_in_allowed_types

  def author?
    user_type == "author"
  end

  def librarian?
    user_type == "librarian"
  end

  def consumer?
    user_type == "consumer"
  end


  private

  def profile_image_type_in_allowed_types
    return unless profile_image.attached? && !profile_image.content_type.in?(%w(image/jpeg image/png))
    errors.add(:profile_image, 'must be a JPEG or PNG file')
  end
end
