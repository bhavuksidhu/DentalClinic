json.extract! staff_info, :id, :staff_code, :first_name, :last_name, :sex, :job_type, :occupation, :usage_classification, :hire_date, :date_of_leaving_company, :created_at, :updated_at
json.url staff_info_url(staff_info, format: :json)
