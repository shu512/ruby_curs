class CreateExaminations < ActiveRecord::Migration[6.0]
  def change
    create_table :examinations do |t|
      t.timestamp :date
      t.references :group, null: false, foreign_key: true
      t.references :discipline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
