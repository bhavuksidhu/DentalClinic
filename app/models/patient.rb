class Patient < ApplicationRecord
    belongs_to :dentist 
    belongs_to :dentist_hygienist
    belongs_to :treatment_coordinator
    
    validates :first_name, :last_name, :phone, :patient_number, presence: true

    validates :patient_number, uniqueness: true 

    def next_treatment 
        arr = self.appointment 
        next_date = arr.sort.select{|a| a >= DateTime.now }  
        next_date.first
    end 

    def last_treatment 
        arr = self.appointment 
        last_date = arr.sort.select{|a| a <= DateTime.now }
        last_date.last  
    end 

end
