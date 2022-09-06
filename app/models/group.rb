class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_and_belongs_to_many :operations

  validates :name, presence: true
  validates :icon, presence: true

  def all_operations
    operations
  end
end
