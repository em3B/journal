class CreateRememberables < ActiveRecord::Migration[6.1]
  def change
    create_table :rememberables do |t|

      t.timestamps
    end
  end
end
