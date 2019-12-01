class Group < ApplicationRecord
  has_many :students, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 3,
                             maximum: 10 }
  validates :size, presence: true,
                   numericality: { greater_then: 0 } # ?
end
