class ChangeType < ActiveRecord::Migration[7.0]
  def change
    remove_column :oral_types, :exp_date
    remove_column :oral_types, :imp_date
    add_column :oral_types, :exp_date, :date
    add_column :oral_types, :imp_date, :date
  end
end
