class Course < ApplicationRecord
  has_many :cohorts

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :class_hours, numericality: { greater_than_or_equal_to: 0 }
end