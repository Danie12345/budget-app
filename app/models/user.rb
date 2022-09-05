class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :groups, dependent: :delete_all, foreign_key: 'user_id'
  has_many :operations, dependent: :delete_all, foreign_key: 'author_id'

  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true
end
