class Match < ApplicationRecord
  belongs_to :team1, :class_name => "Team"
  belongs_to :team2, :class_name => "Team"

  def is_draw
    return registration_score == opponent_score
  end

  def get_winner
    if is_draw
      p "Draw"
      return -1
    end

    if registration_score > opponent_score
      return registration_id
    else
      return opponent_id
    end
  end

  def get_loser
    if is_draw
      p "Draw"
      return -1
    end

    if registration_score < opponent_score
      return registration_id
    else
      return opponent_id
    end
  end
end
