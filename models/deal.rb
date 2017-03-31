require_relative('../db/sql_runner')

class Deal

  attr_reader :id, :day_id, :menu_item_id, :deal_name

  def initialize(deal_hash)
    @id = deal_hash['id'].to_i
    @day_id = deal_hash['day_id'].to_i
    @menu_item_id = deal_hash['menu_item_id'].to_i
    @deal_name = deal_hash['deal_name']
  end

end
