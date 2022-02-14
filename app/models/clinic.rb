class Clinic < ApplicationRecord

    validates :name,:postal_code, :region, :address, :municipalities, :building_name, :floors, :fax_number, :phone_number, presence: true

end
