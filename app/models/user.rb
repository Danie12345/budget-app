class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :groups, dependent: :delete_all, foreign_key: 'author_id'
  has_many :operations, dependent: :delete_all, foreign_key: 'author_id'

  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true

  def groups
    Group.where(user_id: id).all
  end

  def operations
    Operation.where(user_id: id).all
  end
end
