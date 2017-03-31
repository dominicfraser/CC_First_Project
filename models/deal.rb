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
    sql = "INSERT INTO deals (day_id,menu_item_id,deal_name) VALUES (#{@day_id},#{@menu_item_id},'#{@deal_name}' RETURNING id) "
    deals_array = SqlRunner.run(sql)
    @id = deals_array.first['id'].to_i
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM deals"
    deals = SqlRunner.run(sql)
    deal_objects = deals.map{|deal| Deal.new(deal)}
    return deal_objects
  end

end
