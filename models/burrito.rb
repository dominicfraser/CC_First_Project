require_relative('../db/sql_runner')

class Burrito

  attr_reader :id, :burrito_name

  def initialize(burrito_hash)
    @id = burrito_hash['id'].to_i
    @burrito_name = burrito_hash['burrito_name']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO burritos (burrito_name) VALUES ('#{@burrito_name}') RETURNING id"
    burritos_array = SqlRunner.run(sql)
    @id = burritos_array.first['id'].to_i
  end


  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM burritos"
    burritos = SqlRunner.run(sql)
    burrito_objects = burritos.map{|burrito| Burrito.new(burrito)}
    return burrito_objects
  end

end