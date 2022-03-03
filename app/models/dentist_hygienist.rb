class DentistHygienist < ApplicationRecord
    has_many :patients 
    validates :first_name, :last_name, :phone ,presence: true
end
