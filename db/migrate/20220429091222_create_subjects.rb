class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :group, null: false, foreign_key: true
      t.integer :teacher_id

      t.timestamps
    end
  end
end
