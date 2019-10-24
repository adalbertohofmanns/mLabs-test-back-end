class Parking < ApplicationRecord
  validates_format_of :plate, :with => /\A[A-Z]{3}-[0-9]{4}\z/, :on => :create

  def plate_show
    {
      plate: self.plate,
      paid: self.paid,
      letf: self.left,
      time: (self.time.strftime('%H:%M') unless self.time.blank?),
      created_at: self.created_at,
      updated_at: self.updated_at,
    }
  end

end
