class RemoveUniqueFromCohorts < ActiveRecord::Migration[5.2]
  def change
    remove_index :cohorts, :course_id
    add_index :cohorts, :course_id
  end
end
