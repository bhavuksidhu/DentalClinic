class OralType < ApplicationRecord
  belongs_to :counseling
  enum name: { bad_breath: "Bad Breath", microscope: "Microscope", saliva: "Saliva" }
end
