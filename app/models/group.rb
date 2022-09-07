class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_and_belongs_to_many :operations

  validates :name, presence: true
  validates :icon, presence: true, format: { with: %r{\.png|jpg|jpeg|gif}i, message: "Use an image or video with formats: png, jpg, jpeg or gif." }

  def total
    operations.sum(:amount)
  end
end
