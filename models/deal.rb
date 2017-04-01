require_relative('../db/sql_runner')

class Deal

  attr_reader :id, :day_id, :menu_item_id, :deal_name

  def initialize(deal_hash)
    @id = deal_hash['id'].to_i
    @day_id = deal_hash['day_id'].to_i
    @menu_item_id = deal_hash['menu_item_id'].to_i
    @deal_name = deal_hash['deal_name']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO deals (day_id,menu_item_id,deal_name) VALUES (#{@day_id},#{@menu_item_id},'#{@deal_name}') RETURNING id "
    deals_array = SqlRunner.run(sql)
    @id = deals_array.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM deals WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM deals"
    return Deal.map_deals(sql)
  end

  def self.all_on_day(day)
    sql = "SELECT * FROM deals WHERE day_id = #{day.id} "
    return Deal.map_deals(sql)
  end


  def self.delete(id)
    sql = "DELETE FROM deals WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete(deal_name)
    sql = "DELETE FROM deals WHERE deal_name = '#{deal_name}' "
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM deals WHERE id = #{id}"
    deal = SqlRunner.run(sql).first
    deal_object = Deal.new(deal)
    return deal_object
  end
  
  ## Helper
  def self.map_deals(sql)
    deals = SqlRunner.run(sql)
    deal_objects = deals.map{|deal| Deal.new(deal)}
    return deal_objects
  end

end
