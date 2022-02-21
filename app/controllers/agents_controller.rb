class AgentsController < ApplicationController
    layout "dashboard"

    def index 
        @q = Agent.ransack(params[:q])
        @pagy, @users = pagy(@q.result) 
    end 

    def new 
        @agent = Agent.new 
    end 
    
    def create 
        @agent = Agent.new(agent_params)
        if @agent.save 
            redirect_to agents_path, notice: "Agent #{@agent.first_name} Successfully Created!" 
        else  
            render :new, status: :unprocessable_entity 
        end 
    end 
    
    def edit 
        @agent = Agent.find(params[:id])
    end 

    def update 
        @agent = Agent.find(params[:id])

        if @agent.update(agent_params)
            redirect_to agents_path, notice: "Agent #{@agent.first_name} Successfully Updated!"
        else 
            render :edit, status: :unprocessable_entity 
        end  
    end 

    def destroy 
        @agent = Agent.find(params[:id])
        @agent.destroy 

        redirect_to agents_path, notice: "Agent #{@agent.first_name} was successfully Deleted!"
    end 

    private 

    def agent_params 
        params.require(:agent).permit(:first_name, :last_name)
    end 
end
