require_relative('../db/sql_runner')

class Day

  attr_reader :id, :day_name

  def initialize(day_hash)
    @id = nil || day_hash['id'].to_i
    @day_name = day_hash['day_name']
  end

end