class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :teacher
      t.string :username
      t.string :password
      t.integer :teacher_id
      t.string :school_name
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
