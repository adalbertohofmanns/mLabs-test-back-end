class Parking < ApplicationRecord
  validates_format_of :plate, :with => /\A[A-Z]{3}-[0-9]{4}\z/, :on => :create
end
