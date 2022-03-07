class Counseling < ApplicationRecord
    validates :resp_dr, :resp_couns_staff, :imp_type, :exp_date, :imp_date,
               :course_name, :course_imp_date, :course_type, :first_visit,
               :re_first_visit, :second_visit, :p_consult, :inspection,
               :treat_plan, :prostho, :denture, :whitening, :implant,
               :invisalign, :other_correc, :micro, :maintainance,
               :main_resv_date, :main_trans, :type_agree, :prostho_type,
               :no_of_implant, :site, :offer_amt, :agreement,
               :cons_sign_date, :contract_amt, presence: true
end
