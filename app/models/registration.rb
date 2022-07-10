class Registration < ApplicationRecord
  has_many :matches
  has_many :opponents, :through => :matches
  has_many :inverse_matches, :class_name => "Match", :foreign_key => "match_id"
  has_many :inverse_registrations, :through => :inverse_matches, :source => :registration
end
