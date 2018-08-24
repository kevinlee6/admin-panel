class RemoveIndexFromCohorts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cohorts, :instructor_id
  end
end
