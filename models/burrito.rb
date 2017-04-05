require_relative('../db/sql_runner')
require('pry')

class Burrito

  attr_reader :id, :burrito_name, :burrito_cat

  def initialize(burrito_hash)
    @id = burrito_hash['id'].to_i
    @burrito_name = burrito_hash['burrito_name']
    @burrito_cat = burrito_hash['burrito_cat'].to_i
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO burritos (burrito_name,burrito_cat) VALUES ('#{@burrito_name}',#{@burrito_cat}) RETURNING id"
    burritos_array = SqlRunner.run(sql)
    @id = burritos_array.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM burritos WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE burritos SET (burrito_name,burrito_cat) = ('#{@burrito_name}',#{@burrito_cat}) "
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

  def price_after(deal, eatery)
    return 'Special Deal!' if deal.operator == 'special'
    old_p = self.price(eatery)
    old_p_and_operator = old_p.method(deal.operator)
    new_p = old_p_and_operator.call(deal.operand.to_f)    
    return "£#{new_p.to_f.round(2)}"
  end

  def category()
    sql = " SELECT * FROM food_categories WHERE id = #{@burrito_cat}"
    category_pg = SqlRunner.run(sql).first
    return FoodCategory.new(category_pg)
  end


  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM burritos"
    Burrito.map_burritos(sql)
  end

  def self.all_without_first()
    sql = "SELECT * FROM burritos WHERE id NOT IN (1)"
    Burrito.map_burritos(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM burritos WHERE id = #{id}"
    burrito = SqlRunner.run(sql).first
    return Burrito.new(burrito)
  end
  
  ## Helper
def self.map_burritos(sql)
  burritos = SqlRunner.run(sql)
  burrito_objects = burritos.map{|burrito| Burrito.new(burrito)}
  return burrito_objects
end

end