class CreateExamlists < ActiveRecord::Migration[6.0]
  def change
    create_table :examlists do |t|
      t.references :student, null: false, foreign_key: true
      t.references :examination, null: false, foreign_key: true
      t.integer :mark

      t.timestamps
    end
  end
end
