class AddFk < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :instructors, :cohorts
  end
end
