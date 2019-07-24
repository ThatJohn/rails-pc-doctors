class WorkOrder < ApplicationRecord

  validates :jobname, length: {minimum: 5}
  validates :jobname, presence: true

  validate :name_cannot_begin_with_number

  def name_cannot_begin_with_number
    if self.jobname.start_with?("1","2","3","4","5","6","7","8","9","0")
      self.errors.add(:jobname, "Cannot begin with number" )
    end
  end

  belongs_to :technician
  belongs_to :client
end