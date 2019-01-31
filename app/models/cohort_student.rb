# frozen_string_literal: true

class CohortStudent < ApplicationRecord
  belongs_to :cohort
  belongs_to :student
end
