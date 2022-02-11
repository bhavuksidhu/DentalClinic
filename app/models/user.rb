class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: { Administrator: 'Administrator', ClinicUser: 'ClinicUser'}, _default: " "
  after_initialize :set_default_role, :if => :new_record?
              
  def set_default_role
    self.role ||= :ClinicUser
  end
end
