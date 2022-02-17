class AddAppointmentDateToPatient < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :appointment, :string, array:true, default: []
  end
end
