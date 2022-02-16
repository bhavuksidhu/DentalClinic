class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attribute :current_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :masqueradable

  enum role: { Administrator: 'Administrator', ClinicUser: 'ClinicUser'}, _default: " "
  after_initialize :set_default_role, :if => :new_record? 
              
  def set_default_role
    self.role ||= :ClinicUser
  end
end
