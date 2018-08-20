class Cohort < ApplicationRecord
  has_one :instructor
  has_many :students
  belongs_to :course

  validates :name, presence: true
end