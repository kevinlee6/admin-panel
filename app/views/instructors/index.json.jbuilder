# frozen_string_literal: true

json.array! @instructors, partial: 'instructors/instructor', as: :instructor
