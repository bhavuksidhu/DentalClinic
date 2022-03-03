class CreateStaffInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :staff_infos do |t|
      t.string :staff_code
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :job_type
      t.string :occupation
      t.string :usage_classification
      t.datetime :hire_date
      t.datetime :date_of_leaving_company

      t.timestamps
    end
  end
end
