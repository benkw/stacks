class Stock < ApplicationRecord
  belongs_to :stack
  validates :stack_id, presence: true
  validates :name, presence: true
  validates :ticker, presence: true
end
