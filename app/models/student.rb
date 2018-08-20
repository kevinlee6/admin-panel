class Student < ApplicationRecord
  belongs_to :cohort

  validates :first_name, :last_name, presence: true
  validates :age, inclusion: { in: 0...150 }
end