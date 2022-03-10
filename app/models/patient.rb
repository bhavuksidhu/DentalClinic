class Patient < ApplicationRecord
    audited
    belongs_to :dentist 
    belongs_to :dentist_hygienist
    belongs_to :treatment_coordinator
    has_one :visit_route
    
    validates :first_name, :last_name, :phone, :patient_number, presence: true

    validates :patient_number, uniqueness: true 

    def full_name 
        self.first_name + self.last_name 
    end 

    def last_appointment 
        count = self.visit_route.audits.count - 1
        self.visit_route.revision(count).next_reservation_date
    end 

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
