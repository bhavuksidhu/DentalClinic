class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :counselings, :course_imp_date
    remove_column :counselings, :pcourse_imp_date
    add_column :counselings, :course_imp_date, :date
    add_column :counselings, :pcourse_imp_date, :date
  end
end
