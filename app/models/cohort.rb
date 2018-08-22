class Cohort < ApplicationRecord
  belongs_to :course
  has_one :instructor
  has_many :cohort_students
  has_many :students, through: :cohort_students

  validates :name, presence: true
end