class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :counselings, :course_imp_date, :date
    add_column :counselings, :pcourse_imp_date, :date
  end
end
