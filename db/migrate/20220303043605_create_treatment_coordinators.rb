class CreateTreatmentCoordinators < ActiveRecord::Migration[7.0]
  def change
    create_table :treatment_coordinators do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone

      t.timestamps
    end
  end
end
