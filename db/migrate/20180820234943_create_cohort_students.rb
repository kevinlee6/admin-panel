# frozen_string_literal: true

class CreateCohortStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :cohort_students do |t|
      t.integer :student_id, null: false
      t.integer :cohort_id, null: false

      t.timestamps
    end

    add_index :cohort_students, %i[student_id cohort_id]
  end
end
