class RemoveFkInstructorsCohorts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :instructors, :cohorts
  end
end
