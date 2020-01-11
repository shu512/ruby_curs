class Question < ApplicationRecord
  belongs_to :discipline
  validates :content, presence: true,
                      length: { minimum: 3,
                                maximum: 100 }
end
