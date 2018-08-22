class RemoveCohortidFromStudent < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :cohort_id
  end
end