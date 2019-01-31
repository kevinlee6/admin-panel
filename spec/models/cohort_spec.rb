# frozen_string_literal: true

require 'rails_helper'

params = {
  name: 'Test',
  start_date: DateTime.now - 5,
  end_date: DateTime.now,
  course_id: 1
}

RSpec.describe Cohort, type: :model do
  context 'validation tests' do
    before do
      Course.new(name: 'Test', class_hours: 10).save
      params[:course_id] = Course.last.id;
    end

    it 'ensures that it can be saved' do
      cohort = Cohort.new(params).save
      expect(cohort).to eq true
    end

    it 'ensures that it must belongs_to course' do
      mod_params = params.clone
      mod_params.delete(:course_id)
      cohort = Cohort.new(mod_params).save
      expect(cohort).to eq false
    end

    it 'ensures that it must course it belongs_to must be valid' do
      new_course_id = { course_id: 0 } 
      mod_params = params.merge(new_course_id)
      cohort = Cohort.new(mod_params).save
      expect(cohort).to eq false
    end

    it 'ensures start_date cannot be greater than end_date' do
      new_dates = { start_date: DateTime.now, end_date: DateTime.now - 5 }
      mod_params = params.merge(new_dates)
      cohort = Cohort.new(mod_params).save
      expect(cohort).to eq false
    end

    it 'ensures name must exist' do
      mod_params = params.clone
      mod_params.delete(:name)
      cohort = Cohort.new(mod_params).save
      expect(cohort).to eq false
    end

    it 'ensures start_date must exist' do
      mod_params = params.clone
      mod_params.delete(:start_date)
      cohort = Cohort.new(mod_params).save
      expect(cohort).to eq false
    end

    it 'ensures end_date must exist' do
      mod_params = params.clone
      mod_params.delete(:end_date)
      cohort = Cohort.new(mod_params).save
      expect(cohort).to eq false
    end
  end
end
