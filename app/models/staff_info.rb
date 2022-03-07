class StaffInfo < ApplicationRecord
    validates :staff_code, :first_name, :last_name, :sex, :job_type, :occupation, :usage_classification, :hire_date, :date_of_leaving_company, presence: true
    validates_uniqueness_of :staff_code
    enum sex: { male: "Male", female: "Female" }
end
