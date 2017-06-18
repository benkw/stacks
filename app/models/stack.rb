class Stack < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 16 }
  validates :description, presence: true, length: { maxiumum: 255 }
end
