class AddConstraints < ActiveRecord::Migration[5.2]
  def change
    remove_index :instructors, :cohort_id
    add_index :instructors, :cohort_id, unique: true
    remove_index :cohorts, :course_id
    add_index :cohorts, :course_id, unique: true
    remove_index :cohorts, :instructor_id
    add_index :cohorts, :instructor_id, unique: true
  end
end
