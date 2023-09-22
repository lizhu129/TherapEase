class Meeting < ApplicationRecord
  belongs_to :package

  validates :status, presence: true, inclusion: { in: ["No date set", "Pending", "Confirmed", "Cancelled", "Excused", "Done"] }
  def meeting_label
    patient = self.package.patient
    "#{patient.first_name} #{patient.last_name} - #{self.start_time.strftime("%d/%m/%Y %H:%M")} - #{self.end_time.strftime("%H:%M")}"
  end
end
