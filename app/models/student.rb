class Student < ApplicationRecord
  has_many :cohort_students
  has_many :cohorts, through: :cohort_students
  has_one :user, as: :userable

  validates :first_name, :last_name, presence: true
  validates :age, inclusion: { in: 0...150 }
end