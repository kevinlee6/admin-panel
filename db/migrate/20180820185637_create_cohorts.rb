# frozen_string_literal: true

class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :course, null: false

      t.timestamps null: false
    end
  end
end
