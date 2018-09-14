class Instructor < ApplicationRecord
  def self.education
    %w[High\ School College Masters PhD]
  end

  belongs_to :cohort, optional: true
  has_one :user, as: :userable

  validates :first_name, :last_name, :education, presence: true
  validates :education, inclusion: { in: Instructor.education }
  validates :age, inclusion: { in: 0...150 }
  validates :salary, numericality: { greater_than_or_equal_to: 0, less_than: 2**31 }
  validates_uniqueness_of :cohort_id, allow_blank: true
end