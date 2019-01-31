# frozen_string_literal: true

json.extract! cohort, :id, :name, :start_date, :end_date, :created_at, :updated_at
json.url cohort_url(cohort, format: :json)
