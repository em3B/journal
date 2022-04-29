class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :entry, null: false, foreign_key: true
      t.text :content
      t.boolean :active

      t.timestamps
    end
  end
end
