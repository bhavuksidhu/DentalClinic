class UserPolicy < Struct.new(:current_user, :target_user)    
  # def create?
  #   registration_roles.include?(target_user.role)
  # end

  # private

  # def registration_roles
  #   %w(Admin)
  # end
end