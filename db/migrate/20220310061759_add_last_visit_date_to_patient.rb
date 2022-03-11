class AddLastVisitDateToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :last_visit_date, :date
  end
end
