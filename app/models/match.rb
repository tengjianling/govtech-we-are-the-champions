class Match < ApplicationRecord
  belongs_to :registration
  belongs_to :opponent, :class_name => "Registration"
end
