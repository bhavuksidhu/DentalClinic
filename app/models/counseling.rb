class Counseling < ApplicationRecord
    validates :first_visit, :second_visit, :treat_plan, :prostho, :main_trans, presence: true
    has_many :oral_types, dependent: :destroy
    accepts_nested_attributes_for :oral_types
    belongs_to :patient
end



@first_visit = 0  
@second_visit = 0
@treat_plan = 0
@maintainance = 0                
@prostho = 0  