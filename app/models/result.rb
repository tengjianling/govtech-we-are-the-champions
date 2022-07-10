class Result < ApplicationRecord

  def self.get_points_hash
    points = {}
    Registration.each do |r|
      points[r.id] = 0
    end

    Match.each do |m|
      if m.is_draw
        points[m.registration_id] += 1
        points[m.opponent_id] += 1
      else
        points[m.get_winner] += 1
      end
    end

    return points
  end

  def self.get_alternative_points_hash
    points = {}
    Registration.each do |r|
      points[r.id] = 0
    end

    Match.each do |m|
      if m.is_draw
        points[m.registration_id] += 3
        points[m.opponent_id] += 3
      else
        points[m.get_winner] += 5
        points[m.get_loser] += 1
      end
    end
    return points
  end
end
