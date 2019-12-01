class Student < ApplicationRecord
  belongs_to :group
  validates :full_name, presence: true,
                        length: { minimum: 5,
                                  maximum: 40 }
end
