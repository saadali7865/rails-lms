require 'elasticsearch/model'

class Book < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :active, -> { where(is_active: true) }

  belongs_to :user
  has_many :lend_books

  enum :category, [:horror, :action, :romantic]

  validates :title, presence: true
  validates :category, presence: true
end
