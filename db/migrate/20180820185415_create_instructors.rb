class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false
      t.integer :salary, null: false
      t.string :education, null: false
      t.references :cohort

      t.timestamps
    end
  end
end
