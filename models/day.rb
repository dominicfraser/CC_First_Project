require_relative('../db/sql_runner')

class Day

  attr_reader :id, :day_name

  def initialize(day_hash)
    @id = nil || day_hash['id'].to_i
    @day_name = day_hash['day_name']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO days (day_name) VALUES ('#{@day_name}') RETURNING id" 
    days_array = SqlRunner.run(sqL)
    @id = days_array.first['id'].to_i
  end

end