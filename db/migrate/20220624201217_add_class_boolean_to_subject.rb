class AddClassBooleanToSubject < ActiveRecord::Migration[6.1]
  def change
    add_column :subjects, :class_boolean, :boolean
  end
end
