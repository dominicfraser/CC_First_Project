require_relative('../db/sql_runner')

class Eatery

  attr_reader :id, :eatery_name

  def initialize(eatery_hash)
    @id = eatery_hash['id'].to_i
    @eatery_name = eatery_hash['eatery_name']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO eateries (eatery_name) VALUES ('#{@eatery_name}') RETURNING id"
    eateries_array = SqlRunner.run(sql)
    @id = eateries_array.first['id'].to_i
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM eateries"
    eateries = SqlRunner.run(sql)
    eateries_objects = eateries.map{|eatery| Eatery.new(eatery)}
    return eateries_objects
  end

  def self.all_menu_items()
    sql = "SELECT * FROM menu_items WHERE eatery_id = #{self.id}"
    mi = SqlRunner.run(sql)
    mi_objects = mi.map{|mi| MenuItem.new(mi)}
    return mi_objects
  end

end