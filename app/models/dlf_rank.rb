class DlfRank < ActiveRecord::Base
  belongs_to :player, foreign_key: :player_id
  belongs_to :month
end
