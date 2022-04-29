class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.date :session_date
      t.references :subject, null: false, foreign_key: true
      t.text :content
      t.text :objective
      t.text :steps
      t.text :score

      t.timestamps
    end
  end
end
