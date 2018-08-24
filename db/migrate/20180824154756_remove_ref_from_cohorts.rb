class RemoveRefFromCohorts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cohorts, :instructor
  end
end
