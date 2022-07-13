class TeamCreatorValidator < ActiveModel::Validator

  # checks if a string is a number
  def is_numeric(o)
    true if Integer(o) rescue false
  end
  
  def validate(record)
    teams_to_create = record.user_input.split("\n")

    teams_to_create.each do |t|
      fields = t.split(" ")
      if fields.size < 3
        record.errors.add :user_input, "Missing Arguments"
      elsif fields.size > 3
        record.errors.add :user_input, "Too Many Arguments"
      else
        name = fields[0]
        date = fields[1]
        day = date.split("/")[0]
        month = date.split("/")[1]
        begin
          formatted_date = Date.parse("2022-" + month + "-" + day)
        rescue ArgumentError
          nil
        end
        group = fields[2]

        if !is_numeric(group)
          record.errors.add :user_input, "Group field must be an integer"
        end

        if formatted_date == nil
          record.errors.add :user_input, "Date field is an invalid format"
        end

        if Team.find_by(name: name) != nil
          record.errors.add :user_input, "Team is already registered"
        end
      end

      
    end

  end
end

class TeamsCreator < ApplicationRecord
  include ActiveModel::Validations
  validates :user_input, presence: true 
  validates_with TeamCreatorValidator
end
