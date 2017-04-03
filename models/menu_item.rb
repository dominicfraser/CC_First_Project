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

  def create_deal(day, deal_name, bur_cat)
    Deal.new({ 
      'day_id' => day,
      'deal_name' => deal_name,
      'menu_item_id' => self.id,
      'burrito_cat' => bur_cat.id
      })
  end

  def is_in_a_selection?(selection)
    result = selection.any?{|burrito| burrito.id == self.burrito_id }
    return result
  end

  def delete()
    sql = "DELETE FROM menu_items WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM menu_items"
    mis = SqlRunner.run(sql)
    mi_objects = mis.map{|mi| MenuItem.new(mi)}
    return mi_objects
  end

  def self.find(id)
    sql = "SELECT * FROM menu_items WHERE id = #{id}"
    menu_item = SqlRunner.run(sql).first
    result = MenuItem.new(menu_item)
  end
  
  def self.find(eatery_id)
    sql = "SELECT * FROM menu_items WHERE eatery_id = #{eatery_id}"
    mi = SqlRunner.run(sql)
    mi_objects = mi.map{|mi| MenuItem.new(mi)}
    return mi_objects
  end

  def self.new_all(burrito_id, price)
    @eateries = Eatery.all_without_first

    @eateries.each{|eatery|
      MenuItem.new({
        'eatery_id' => eatery.id,
        'burrito_id' => burrito_id,
        'price' => price.to_i
        }).save
      }
  end

end