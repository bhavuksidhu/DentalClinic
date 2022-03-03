class AddColumnsToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :patient_number, :integer
    add_column :patients, :visit_route, :string
    add_column :patients, :keyword, :string
    add_column :patients, :panorama, :boolean
    add_column :patients, :caries_check, :boolean
    add_column :patients, :course, :string
    add_column :patients, :p_course, :string
    add_column :patients, :note, :text
    add_reference :patients, :dentist, null: false, foreign_key: true
    add_reference :patients, :dentist_hygienist, null: false, foreign_key: true
    add_reference :patients, :treatment_coordinator, null: false, foreign_key: true
  end
end
