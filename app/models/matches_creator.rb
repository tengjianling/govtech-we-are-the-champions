class MatchCreatorValidator < ActiveModel::Validator

  # checks if a string is a number
  def is_numeric(o)
    true if Integer(o) rescue false
  end
  
  def validate(record)
    matches_to_create = record.user_input.split("\n")

    matches_to_create.each do |m|
      fields = m.split(" ")
      if fields.size < 4
        record.errors.add :user_input, "Missing Arguments"
      elsif fields.size > 4
        record.errors.add :user_input, "Too Many Arguments"
      
      else
        team1_name = fields[0]
        team2_name = fields[1]
        team1_score = fields[2]
        team2_score = fields[3]
  
        if !is_numeric(team1_score) or !is_numeric(team2_score)
          record.errors.add :user_input, "Team1 and Team2 scores must be integers"
        end


        if Team.find_by(name: team1_name) == nil
          record.errors.add :user_input, "First team is not registered"
        end

        if Team.find_by(name: team2_name) == nil
          record.errors.add :user_input, "Second team is not registered"
        end

        if Team.find_by(name: team1_name).group != Team.find_by(name: team2_name).group
          record.errors.add :user_input, "Cannot have match between teams from different groups"
        end

        if team1_name == team2_name
          record.errors.add :user_input, "Cannot have match between the same team"
        end

      end
      
    end

  end
end

class MatchesCreator < ApplicationRecord
  validates :user_input, presence: true 
  validates_with MatchCreatorValidator
end
