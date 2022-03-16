module CounselingAggregation
    class AggregationBasicFilter 
        def initialize(aggregation_filter)
            @aggregation_period = aggregation_filter
        end
    
        def aggregation_filter
            if @aggregation_period == "6Months"
                @aggregation_basic_information=Counseling.where(created_at: 6.months.ago..Time.now)
            
            elsif @aggregation_period == "1Year"
                @aggregation_basic_information=Counseling.where(created_at: 1.year.ago..Time.now)
            
            elsif @aggregation_period == "7Days"
                @aggregation_basic_information=Counseling.where(created_at: 7.days.ago..Time.now)
            
            elsif @aggregation_period == "15Days"
                @aggregation_basic_information=Counseling.where(created_at: 15.days.ago..Time.now)
            
            elsif @aggregation_period == "30Days"
                @aggregation_basic_information=Counseling.where(created_at: 30.days.ago..Time.now)
            
            elsif @aggregation_period == "Today"
                @aggregation_basic_information=Counseling.where(created_at: Time.now)
                    
            else
                @aggregation_period = "All"
                @aggregation_basic_information=Counseling.all
            end
        end 
    end 
end 