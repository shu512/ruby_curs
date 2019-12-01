class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.integer :number
      t.string :full_name
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
