class AddReferencesOfDentalClinicToPateint < ActiveRecord::Migration[7.0]
  def change
    add_reference :patients, :clinic,  null: false, foreign_key: true
  end
end
