class Stack < ApplicationRecord
  belongs_to :user
  has_many :stocks, dependent: :destroy
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 16 }
  validates :description, presence: true, length: { maximum: 155 }
end
