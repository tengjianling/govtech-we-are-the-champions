class Match < ApplicationRecord
  belongs_to :team1, :class_name => "Team"
  belongs_to :team2, :class_name => "Team"

  def is_draw
    return team1_score == team2_score
  end

  def get_winner
    if is_draw
      p "Draw"
      return -1
    end

    if team1_score > team2_score
      return team1_id
    else
      return team2_id
    end
  end

  def get_loser
    if is_draw
      p "Draw"
      return -1
    end

    if team1_score < team2_score
      return team1_id
    else
      return team2_id
    end
  end
end
