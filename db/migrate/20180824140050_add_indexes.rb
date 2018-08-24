class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_reference :cohorts, :instructor, foreign_key: true, null: false
    remove_column :cohorts, :course_id
    add_reference :cohorts, :course, foreign_key: true, null: false
    remove_column :instructors, :cohort_id
    add_reference :instructors, :cohort, foreign_key: true, null: false
  end
end