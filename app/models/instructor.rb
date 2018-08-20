class Instructor < ApplicationRecord
  has_many :students
  belongs_to :cohort

  validates :first_name, :last_name, :education, presence: true
  validates :age, inclusion: { in: 0...150 }
  validates :salary, numericality: { greater_than_or_equal_to: 0 }
end