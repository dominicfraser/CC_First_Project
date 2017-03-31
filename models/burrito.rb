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

  def delete()
    sql = "DELETE FROM burritos WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE burritos SET (burrito_name) = ('#{@burrito_name}') "
    SqlRunner.run(sql)
  end

  def eateries()
    sql = "SELECT e.* FROM eateries e
    INNER JOIN menu_items m
    ON e.id=m.eatery_id
    WHERE m.burrito_id = #{@id}"
    eatery_array = SqlRunner.run(sql)
    eatery_objects = eatery_array.map{|eatery| Eatery.new(eatery)}
    return eatery_objects
  end

  def price(eatery)
    sql = "SELECT m.price FROM menu_items m
    WHERE burrito_id = #{@id} AND 
    eatery_id = #{eatery.id}"
    price = SqlRunner.run(sql).first['price'].to_f.round(2)
  end  


  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM burritos"
    burritos = SqlRunner.run(sql)
    burrito_objects = burritos.map{|burrito| Burrito.new(burrito)}
    return burrito_objects
  end

end