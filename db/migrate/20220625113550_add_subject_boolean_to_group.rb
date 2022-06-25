class AddSubjectBooleanToGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :subject_boolean, :boolean
  end
end
