class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true

  def group_id
    unless groups.first.nil?
      groups.first.id
    end
  end

  def groups
    groups
  end
end
