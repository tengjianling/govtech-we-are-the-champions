class Result < ApplicationRecord

  def self.get_points_hash
    points = {}
    Team.all.each do |t|
      points[t.id] = 0
    end

    Match.all.each do |m|
      if m.is_draw
        points[m.team1_id] += 1
        points[m.team2_id] += 1
      else
        points[m.get_winner] += 1
      end
    end

    return points
  end

  def self.get_alternative_points_hash
    points = {}
    Team.all.each do |t|
      points[t.id] = 0
    end

    Match.all.each do |m|
      if m.is_draw
        points[m.team1_id] += 3
        points[m.team2_id] += 3
      else
        points[m.get_winner] += 5
        points[m.get_loser] += 1
      end
    end
    return points
  end

  def self.get_number_of_goals_hash
    goals = {}
    Team.all.each do |t|
      goals[t.id] = 0
    end

    Match.all.each do |m|
      goals[m.team1_id] += m.team1_score
      goals[m.team2_id] += m.team2_score
    end
    return goals
  end
end
