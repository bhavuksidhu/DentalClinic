class VisitRoute < ApplicationRecord
  audited
  belongs_to :patient
end
