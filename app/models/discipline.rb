class Discipline < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 3,
                              maximum: 30 }
end
