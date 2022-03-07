class SwapValue
    def initialize(value1,value2)
      @value1 = value1
      @value2 = value2  
    end
    
    def swap_values
        if @value1 > @value2 
            temp = @value1 
            @value1 = @value2 
            @value2 = temp
            return @value1, @value2
        end 
        return @value1, @value2
    end 
end
  