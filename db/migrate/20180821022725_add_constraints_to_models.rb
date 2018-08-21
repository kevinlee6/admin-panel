class AddConstraintsToModels < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :first_name, :string, null: false
    change_column :students, :last_name, :string, null: false
    change_column :students, :age, :integer, null: false

    change_column :courses, :name, :string, null: false
    change_column :courses, :class_hours, :integer, null: false

    change_column :cohorts, :name, :string, null: false
    change_column :cohorts, :start_date, :datetime, null: false
    change_column :cohorts, :end_date, :datetime, null: false

    change_column :instructors, :first_name, :string, null: false
    change_column :instructors, :last_name, :string, null: false
    change_column :instructors, :age, :integer, null: false
    change_column :instructors, :salary, :integer, null: false
    change_column :instructors, :education, :string, null: false
  end
end
