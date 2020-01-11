class Examination < ApplicationRecord
  belongs_to :group
  belongs_to :discipline
  validates :date, presence: true
  validates :group, presence: true
  validates :discipline, presence: true
end
