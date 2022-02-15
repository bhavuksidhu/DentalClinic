class AgentsController < InheritedResources::Base

  private

    def agent_params
      params.require(:agent).permit(:first_name, :last_name, :phone)
    end

end
