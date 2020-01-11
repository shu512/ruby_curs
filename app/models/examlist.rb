class Examlist < ApplicationRecord
  belongs_to :student
  belongs_to :examination
  validates :student, presence: true
  validates :examination, presence: true
  validates :mark, presence: true,
                   numericality: { greater_than: 0,
                                   less_than: 5 }
end
