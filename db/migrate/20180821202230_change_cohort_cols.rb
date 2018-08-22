class ChangeCohortCols < ActiveRecord::Migration[5.2]
  def change
    change_column :cohorts, :start_date, :date, null: false
    change_column :cohorts, :end_date, :date, null: false
  end
end
