# frozen_string_literal: true

json.extract! course, :id, :name, :class_hours, :created_at, :updated_at
json.url course_url(course, format: :json)
