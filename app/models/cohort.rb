# frozen_string_literal: true

class Cohort < ApplicationRecord
  belongs_to :course
  has_one :instructor, dependent: :nullify
  has_many :cohort_students
  has_many :students, through: :cohort_students

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date?

  private

  def end_date_after_start_date?
    if end_date && start_date && end_date < start_date
      errors.add :end_date, 'must be after start date'
    end
  end
end
