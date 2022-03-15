module VisitRoutesHelper

    def new_patient_progress(couns)
            @first_visit = 0
            @no_of_patients = Patient.all.group_by { |t| t.created_at.beginning_of_month }.count  
            @second_visit = 0
            @treat_plan = 0
            @maintainance = 0                
            @prostho = 0  
            @implant_correction = 0
            @visit_after_interruption = 0  
            @p_second = 0    
            @inspection_3 = 0
            @end_date = 0
            @main_trans = 0
            @medical_tube = 0
            @next_reservation_date = 0
            @p_heavy_defense_target = 0
            @whitening = 0
            @malocclusion = 0
            @p_heavy_defense_calculation_date = 0
            @inspection_4mm = 0
            @fop = 0

            #  for new patient progress (individual)
            @suspension = 0
            @mt_tooth_number = 0

         couns.second.each do |couns_data|
            
                    unless couns_data.counseling.first_visit.nil?
                          @first_visit = @first_visit+1 
                    end 
                    unless couns_data.counseling.second_visit.nil?
                          @second_visit = @second_visit+1 
                    end 
                    unless couns_data.counseling.treat_plan.nil?
                         @treat_plan = @treat_plan+1 
                    end 
                    unless couns_data.counseling.maintainance.nil?
                         @maintainance = @maintainance+1 
                    end                     
                    unless couns_data.counseling.prostho.nil?
                        @prostho = @prostho+1 
                    end 
                    unless couns_data.visit_route.implant_correction.nil?
                        @implant_correction = @implant_correction+1 
                    end  
                    unless couns_data.visit_route.visit_after_interruption.nil?
                        @visit_after_interruption = @visit_after_interruption+1 
                    end 
                    unless couns_data.visit_route.p_second.nil?
                        @p_second = @p_second+1 
                    end 
                    unless couns_data.visit_route.inspection_3.nil?
                        @inspection_3 = @inspection_3+1 
                    end 
                    unless couns_data.visit_route.end_date.nil?
                        @end_date = @end_date+1 
                    end        
                    unless couns_data.counseling.main_trans.nil?
                        @main_trans = @main_trans+1 
                    end 
                    unless couns_data.visit_route.medical_tube.nil?
                        @medical_tube = @medical_tube+1 
                    end 
                    unless couns_data.visit_route.next_reservation_date.nil?
                        @next_reservation_date = @next_reservation_date+1 
                    end 
                    unless couns_data.visit_route.p_heavy_defense_target.nil?
                        @p_heavy_defense_target = @p_heavy_defense_target+1 
                    end
                    unless couns_data.visit_route.whitening.nil?
                        @whitening = @whitening+1 
                    end
                    unless couns_data.visit_route.malocclusion.nil?
                        @malocclusion = @malocclusion+1 
                    end
                    unless couns_data.visit_route.p_heavy_defense_calculation_date.nil?
                        @p_heavy_defense_calculation_date = @p_heavy_defense_calculation_date+1 
                    end
                    unless couns_data.visit_route.inspection_4mm.nil?
                        @inspection_4mm = @inspection_4mm+1 
                    end
                    unless couns_data.visit_route.fop.nil?
                        @fop = @fop+1 
                    end
                
                    #  for new patient progress (individual)
                    unless couns_data.visit_route.suspension.nil?
                        @suspension = @suspension+1 
                    end
                    unless couns_data.visit_route.mt_tooth_number.nil?
                        @mt_tooth_number = @mt_tooth_number+1 
                    end
                           # Calculation

                            @first_visit_rate = @first_visit.to_f/ @no_of_patients.to_f
                            @second_visit_rate = @second_visit.to_f/@no_of_patients.to_f
                            @treat_plan_rate = @treat_plan.to_f/@no_of_patients.to_f
                            @maintainance_rate = @maintainance.to_f/@no_of_patients.to_f                            
                            @prostho_rate = @prostho.to_f/@no_of_patients.to_f   
                            @implant_correction_rate = @implant_correction.to_f/@no_of_patients.to_f
                            @visit_after_interruption_rate = @visit_after_interruption.to_f/@no_of_patients.to_f 
                            @p_second_rate = @p_second.to_f/@no_of_patients.to_f
                            @inspection_3_rate = @inspection_3.to_f/@no_of_patients.to_f
                            @end_date_rate = @end_date.to_f/@no_of_patients.to_f
                            @main_trans_rate = @main_trans.to_f/@no_of_patients.to_f
                            @medical_tube_rate = @medical_tube.to_f/@no_of_patients.to_f     
                            @next_reservation_date_rate = @next_reservation_date.to_f/@no_of_patients.to_f       
                            @p_heavy_defense_target_rate = @p_heavy_defense_target.to_f/@no_of_patients.to_f
                            @whitening_rate = @whitening.to_f/@no_of_patients.to_f
                            @malocclusion_rate = @malocclusion.to_f/@no_of_patients.to_f 
                            @p_heavy_defense_calculation_date_rate = @p_heavy_defense_calculation_date.to_f/@p_heavy_defense_target.to_f
                            @inspection_4mm_rate = @inspection_4mm.to_f/@no_of_patients.to_f
                            @fop_rate = @fop_rate.to_f/@no_of_patients.to_f 
                            @suspension_rate = @suspension.to_f/@no_of_patients.to_f
                            @mt_tooth_number_rate = @mt_tooth_number.to_f/@no_of_patients.to_f
    
                # total
                    #  @first_visit_total = 0
                    #  @second_visit_total = 0
                    #  @treatment_plan_total = 0
                  
                        
                    #   while couns_data.counseling.present?                    
                    #     @first_visit_total += @first_visit_rate
                    #     @second_visit_total += @second_visit
                    #     @treatment_plan_total += @treat_plan 
                    #   end   


                # average
                     
                    #  @first_visit_aver = 0
                    #  @second_visit_aver = 0                    
                    #  i = 0
                 
                    #    unless couns_data.counseling.nil?
                    #       i += 1
                    #       @first_visit_aver += @first_visit
                    #       @second_visit_aver += @second_visit

                    #    end  
                      
                    # @first_visit_aver = @first_visit_aver/i
                    # @second_visit_aver = @second_visit_aver/i
                 
      end
   end
end
