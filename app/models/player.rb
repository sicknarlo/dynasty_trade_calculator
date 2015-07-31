class Player < ActiveRecord::Base
  has_many :dlf_ranks
  has_one :position
  has_one :team
end
