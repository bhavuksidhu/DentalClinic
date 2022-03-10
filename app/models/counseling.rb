class Counseling < ApplicationRecord
    validates :resp_dr, :resp_couns_staff, 
               :course_imp_date, :pcourse_imp_date, :first_visit,
               :re_first_visit, :second_visit, :p_consult, :inspection,
               :treat_plan, :prostho, :denture, :whitening, :implant,
               :invisalign, :other_correc, :micro, :maintainance,
               :main_resv_date, :main_trans, :type_agree, :prostho_type,
               :no_of_implant, :site, :offer_amt, :agreement,
               :cons_sign_date, :contract_amt, presence: true
    has_many :oral_types, dependent: :destroy
    accepts_nested_attributes_for :oral_types
    belongs_to :patient
end
