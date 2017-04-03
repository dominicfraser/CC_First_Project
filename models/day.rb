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

  def find_all_deals(eatery)
    sql = "SELECT d.* FROM deals d
    INNER JOIN menu_items m
    ON d.menu_item_id=m.id
    INNER JOIN eateries e
    ON m.eatery_id=e.id
    WHERE d.day_id = #{@id} AND e.id = #{eatery.id} "
    deals = SqlRunner.run(sql)
    deal_objects = deals.map{|deal|
      Deal.new(deal)}
    return deal_objects
  end

  def find_uniq_deals_by_name_at(eatery)
    non_uniq = self.find_all_deals(eatery)
    uniq = []

    for deal in non_uniq 
      found_match = uniq.find{|entry| entry.deal_name == deal.deal_name}
      #always returns something, even if just nil
      #each: do something as many times as there are things in the array, so when empty it does nothing. if there is something there it compares every value with every value and does an action each time (creating too many << values), whereas .find does it just once then starts the above loop again.
      if !found_match
        uniq << deal
      end
    end
    return uniq
  end

  def find_deal_names(eatery)
    sql = "SELECT d.deal_name FROM deals d
    INNER JOIN menu_items m
    ON d.menu_item_id=m.id
    INNER JOIN eateries e
    ON m.eatery_id=e.id
    WHERE d.day_id = #{@id} AND e.id = #{eatery.id} "
    deal_names_hash = SqlRunner.run(sql).uniq
    deal_names = deal_names_hash.map{|hash| hash['deal_name']}
    return deal_names    
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM days"
    days = SqlRunner.run(sql)
    day_objects = days.map{|day| Day.new(day)}
    return day_objects
  end

  def self.all_without_first
    sql = "SELECT * FROM days WHERE id NOT IN (1)"
    days = SqlRunner.run(sql)
    day_objects = days.map{|day| Day.new(day)}
    return day_objects
  end

  def self.find(id)
    sql = "SELECT * FROM days WHERE id = #{id}"
    day = SqlRunner.run(sql).first
    result = Day.new(day)
    return result
  end

  def self.find_all_week_for(eatery)
    sql = "SELECT d.* FROM deals d
    INNER JOIN menu_items m
    ON d.menu_item_id=m.id
    INNER JOIN eateries e
    ON m.eatery_id=e.id
    WHERE e.id = #{eatery.id} "
    deal_pgs = SqlRunner.run(sql)
    deal_obs_non_uniq = deal_pgs.map{|deal| Deal.new(deal)}
    uniq = []
    for deal in deal_obs_non_uniq 
      found_match = uniq.find{|entry| entry.deal_name == deal.deal_name}
      
      if !found_match
        uniq << deal
      end
    end
    uniq.sort! {|x,y| x.day_id <=> y.day_id}
    return uniq
  end
  
end