class Examlist < ApplicationRecord
  belongs_to :student
  belongs_to :examination
end
