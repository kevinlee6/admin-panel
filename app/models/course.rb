class Course < ApplicationRecord
  has_many :cohorts

  validates :name, presence: true
  validates :class_hours, numericality: { greater_than_or_equal_to: 0 }
end