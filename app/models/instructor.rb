class Instructor < ApplicationRecord
  has_many :students
  belongs_to :cohort

  validates :first_name, :last_name, :education, presence: true
  validates :education, inclusion: { in: %w[High\ School College Masters PhD] }
  validates :age, inclusion: { in: 0...150 }
  validates :salary, numericality: { greater_than_or_equal_to: 0 }

  def self.education
    %w[High\ School College Masters PhD]
  end
end