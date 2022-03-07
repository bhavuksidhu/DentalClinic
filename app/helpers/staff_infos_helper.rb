module StaffInfosHelper

     def staff_code_range()
        StaffInfo.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
     end
   
end
