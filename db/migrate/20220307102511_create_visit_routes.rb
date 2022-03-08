class CreateVisitRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :visit_routes do |t|
      t.date :first_visit
      t.date :second
      t.date :treatment_plan_date
      t.date :implant_correction
      t.boolean :self_pay_contract
      t.date :maintenance
      t.boolean :treatment_plan
      t.boolean :suspension
      t.date :suspended_date
      t.boolean :confirmation_end
      t.date :end_date
      t.boolean :maintenance_visit
      t.date :maintenance_visit_date
      t.boolean :contact_TEL
      t.string :suspension_contact_TEL
      t.boolean :contact_postcard
      t.string :suspended_contact_postcard
      t.string :visit_after_interruption
      t.boolean :p_heavy_defense_target
      t.date :p_heavy_defense_calculation_date
      t.boolean :inspection_4mm
      t.boolean :p_second
      t.boolean :inspection_3
      t.boolean :fop
      t.boolean :whitening
      t.boolean :medical_tube
      t.string :mt_tooth_number
      t.boolean :malocclusion
      t.text :note
      t.string :prosthodontics
      t.date :next_reservation_date
      t.boolean :thank_you_note
      t.string :thank_you_note_patient_no
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
