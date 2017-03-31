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
    days_array = SqlRunner.run(sql)
    @id = days_array.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM days WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE days SET (day_name) = ('#{@day_name}')"
    SqlRunner.run(sql)
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM days"
    days = SqlRunner.run(sql)
    day_objects = days.map{|day| Day.new(day)}
    return day_objects
  end

end