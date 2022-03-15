class Patient < ApplicationRecord
    audited
    belongs_to :dentist 
    belongs_to :dentist_hygienist
    belongs_to :treatment_coordinator
    belongs_to :clinic
    has_one :visit_route
    has_one :counseling
    
    validates :first_name, :last_name, :patient_number, presence: true

    validates :patient_number, uniqueness: true 
    
    # validates :last_visit_date, comparison: { less_than_or_equal_to: Date.today,message: "Wrong Date Entered" }

    def full_name 
        self.first_name + " " + self.last_name
    end 

    def last_appointment
        if self.visit_route 
            count = self.visit_route.audits.count - 1
            self.visit_route.revision(count).next_reservation_date 
        end 
    end 

    def last_visit_updated 
        count = self.audits.count
        if self.audits.count <=2 
            self.revision(count).last_visit_date 
        else 
            self.revision(count-1).last_visit_date 
        end 
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
