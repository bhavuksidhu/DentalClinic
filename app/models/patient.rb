class Patient < ApplicationRecord


    # def next_treatment 
    #     arr = self.appointment 
    #     next_date = arr.sort.select{|a| a >= DateTime.now }  
    #     next_date.first
    # end 

    # def latest_treatment 
    #     arr = self.appointment 
    #     last_date = arr.sort.select{|a| a <= DateTime.now }
    #     last_date.last  
    # end 
end
