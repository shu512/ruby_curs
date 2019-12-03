class Discipline < ApplicationRecord
  has_many :questions, dependent: :destroy
end
