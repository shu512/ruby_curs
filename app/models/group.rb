class Group < ApplicationRecord
  has_many :students, dependent: :destroy
  validates :name, presence: true,
                   length: { minimum: 3,
                             maximum: 10 }
  validates :size, presence: true,
                   numericality: { greater_than: 0 } # ?

  def label
    "Group: #{name}"
  end
end
