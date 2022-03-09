class CreateCounselings < ActiveRecord::Migration[7.0]
  def change
    create_table :counselings do |t|
      t.string :resp_dr
      t.string :resp_couns_staff
      t.string :first_visit
      t.string :re_first_visit
      t.string :second_visit
      t.string :p_consult
      t.string :inspection
      t.string :treat_plan
      t.string :prostho
      t.string :denture
      t.string :whitening
      t.string :implant
      t.string :invisalign
      t.string :other_correc
      t.string :micro
      t.string :maintainance
      t.string :main_resv_date
      t.string :main_trans
      t.string :type_agree
      t.string :prostho_type
      t.string :no_of_implant
      t.string :site
      t.string :offer_amt
      t.string :agreement
      t.string :cons_sign_date
      t.string :contract_amt

      t.timestamps
    end
  end
end
