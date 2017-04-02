require_relative('../db/sql_runner')
require('pry-byebug')

class Deal

  attr_reader :id, :day_id, :menu_item_id, :deal_name, :burrito_cat

  def initialize(deal_hash)
    @id = deal_hash['id'].to_i
    @day_id = deal_hash['day_id'].to_i
    @menu_item_id = deal_hash['menu_item_id'].to_i
    @deal_name = deal_hash['deal_name']
    @burrito_cat = deal_hash['burrito_cat'].to_i
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO deals (day_id,menu_item_id,deal_name,burrito_cat) VALUES (#{@day_id},#{@menu_item_id},'#{@deal_name}',#{@burrito_cat}) RETURNING id "
    deals_array = SqlRunner.run(sql)
    @id = deals_array.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM deals WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def burritos_applies_to(eatery, day)
    # if self.burrito_cat
    if day.id == 1
      sql = "SELECT b.* FROM deals d
      INNER JOIN menu_items m
      ON d.menu_item_id=m.id
      INNER JOIN eateries e
      ON m.eatery_id=e.id
      INNER JOIN burritos b
      ON b.id=m.burrito_id 
      WHERE e.id = #{eatery.id}"
      burrito_pgs = SqlRunner.run(sql)
      burrito_obs_non_uniq = burrito_pgs.map{|burrito| Burrito.new(burrito)}
      uniq = []
      burrito_obs_non_uniq.each{|burrito|
        match = uniq.find{|entry| entry.id == burrito.id}
        uniq << burrito if !match
      }
      return uniq

    else
      sql = "SELECT b.* FROM deals d
      INNER JOIN menu_items m
      ON d.menu_item_id=m.id
      INNER JOIN eateries e
      ON m.eatery_id=e.id
      INNER JOIN burritos b
      ON b.id=m.burrito_id 
      WHERE d.day_id = #{day.id} AND e.id = #{eatery.id}"
      burrito_pgs = SqlRunner.run(sql)
      burrito_obs = burrito_pgs.map{|burrito| Burrito.new(burrito)}
      return burrito_obs
    end
  end

  def eatery_applies_to
    sql = "SELECT e.* FROM deals d
    INNER JOIN menu_items m
    ON d.menu_item_id=m.id
    INNER JOIN eateries e
    ON m.eatery_id=e.id
    WHERE d.day_id = #{self.day_id} AND m.id = #{self.menu_item_id}"
    eatery_pg = SqlRunner.run(sql).first
    eatery = Eatery.new(eatery_pg)
    return eatery
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

  def self.all_uniq_names
    non_uniq = self.all
    uniq = []
    non_uniq.each {|deal| 
      found_match = uniq.find{|entry| entry.deal_name == deal.deal_name}

        if !found_match
          uniq << deal
        end
      }
    uniq.sort! {|x,y| x.day_id <=> y.day_id}
    return uniq
  end

  def self.all_uniq_names_on(day)
    non_uniq = self.all_on_day(day)
    uniq = []
    for deal in non_uniq 
      found_match = uniq.find{|entry| entry.deal_name == deal.deal_name}

        if !found_match
          uniq << deal
        end
    end
    return uniq
  end

  ## Helper
  def self.map_deals(sql)
    deals = SqlRunner.run(sql)
    deal_objects = deals.map{|deal| Deal.new(deal)}
    return deal_objects
  end

end
