class Player < ActiveRecord::Base
  has_many :dlf_ranks
  belongs_to :position, foreign_key: :position_id
  has_one :team

  def stripped_name
  # Returns a string of the first name and last name combined and
  # with all punctuaion removed to search the DB and account for
  # some variations in spelling
  "#{self.first_name}#{self.last_name}".upcase.gsub(" JR", "")
                                              .gsub(" SR", "")
                                              .gsub(" ", "")
                                              .gsub("-", "")
                                              .gsub(".", "")
                                              .gsub("'", "")
  end

end
