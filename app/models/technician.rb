class Technician < ApplicationRecord
  validates :name, presence: true, uniqueness: false, length: {maximum: 15}
  validate :begins_with_x, :y_start

  has_many :work_orders
  has_many :clients, through: :work_orders

  def begins_with_x
    if self.name[0].downcase == "x"
      self.errors.add(:name, "cannot begin with X")
    end
  end

  def y_start
    if self.name[0].downcase == "y"
      self.errors.add(:name, "cannot begin with y")
    end
  end

end