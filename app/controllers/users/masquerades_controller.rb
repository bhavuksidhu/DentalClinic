class Users::MasqueradesController < Devise::MasqueradesController
    def show
      super
    end
  
    def back
      head(401) and return unless send("#{masqueraded_resource_name}_signed_in?")
  
      masqueradable_resource = send("current_#{masqueraded_resource_name}")
  
      self.resource = find_owner_resource(masqueradable_resource)
      return go_back(resource, path: after_back_masquerade_path_for(resource)) unless resource
  
      sign_out(send("current_#{masqueraded_resource_name}")) if resource.class != masqueraded_resource_class
  
      masquerade_sign_in(resource)
      request.env['devise.skip_trackable'] = nil
  
      go_back(resource, path: after_back_masquerade_path_for(resource))
    end
  
    protected
  
    def masquerade_authorize!
      return super if params[:action] == 'back'
  
    end
  
    def after_masquerade_path_for(_resource)
      root_path
    end
  
    def after_back_masquerade_path_for(_resource)
      admin_users_path
    end
  end
  