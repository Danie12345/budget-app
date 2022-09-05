class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :group_operations, dependent: :delete_all
  has_many :groups, through: :group_operations

  validates :name, presence: true
  validates :icon, presence: true
end
