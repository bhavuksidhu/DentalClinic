class VisitRoute < ApplicationRecord
  audited
  belongs_to :patient
  validates :next_reservation_date, comparison: { greater_than_or_equal_to: Date.today,message: "Wrong Date Entered" }
end
