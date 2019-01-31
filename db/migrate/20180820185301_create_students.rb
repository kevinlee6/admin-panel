# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age, null: false

      t.timestamps
    end
  end
end
