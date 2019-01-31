# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cohort, type: :model do
  context 'validation tests' do
    it 'ensures that it must belongs_to course' do
      params = {
        name: 'Test',
        start_date: DateTime.now - 5,
        end_date: DateTime.now
      }
      cohort = Cohort.new(params).save
      expect(cohort).to eq false
    end

    # it 'ensures class_hours presence' do
    #   course = Course.new(name: 'Test').save
    #   expect(course).to eq (false)
    # end

    # it 'ensures class_hours cannot be negative' do
    #   course = Course.new(name: 'Test', class_hours: -20).save
    #   expect(course).to eq (false)
    # end

    # it 'ensures class_hours cannot exceed 32-bit integer limit' do
    #   course = Course.new(name: 'Test', class_hours: 2**31).save
    #   expect(course).to eq (false)
    # end

    # it 'ensures names are unique (not case sensitive)' do
    #   name = 'Test'
    #   name2 = 'test'
    #   course1 = Course.new(name: name, class_hours: 20).save
    #   course2 = Course.new(name: name, class_hours: 20).save
    #   expect(course1).to eq (true)
    #   expect(course2).to eq (false)
    # end

    # it 'ensures saves correctly' do
    #   course = Course.new(name: 'Test', class_hours: 20).save
    #   expect(course).to eq (true)
    # end
  end
end
