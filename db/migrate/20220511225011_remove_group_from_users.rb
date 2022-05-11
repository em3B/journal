class RemoveGroupFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :group, null: false, foreign_key: true
  end
end
