class Group < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_and_belongs_to_many :operations

  validates :name, presence: true
  validates :icon, presence: true,
                   format: {
                     with: /\.png|jpg|jpeg|gif|svg/i,
                     message: 'Link accepts formats: png, jpg, jpeg, svg or gif.'
                   }
  validates_url :icon, allow_blank: true

  def total
    operations.sum(:amount)
  end
end
