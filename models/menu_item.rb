require_relative('../db/sql_runner')

class MenuItem

  attr_reader :id, :eatery_id, :burrito_id, :price

  def initialize(mi_hash)
    @id = mi_hash['id'].to_i
    @eatery_id = mi_hash['eatery_id'].to_i
    @burrito_id = mi_hash['burrito_id'].to_i
    @price = mi_hash['price'].to_f.round(4)
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO menu_items (eatery_id, burrito_id, price) VALUES (#{@eatery_id},#{@burrito_id},#{@price}) RETURNING id"
    mi_array = SqlRunner.run(sql)
    @id = mi_array.first['id'].to_i
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM menu_items"
    mis = SqlRunner.run(sql)
    mi_objects = mis.map{|mi| Menu_Item.new(mi)}
    return mi_objects
  end

end