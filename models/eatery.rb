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

  def delete()
    sql = "DELETE FROM eateries WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE eateries SET (eatery_name) = ('#{@eatery_name}') "
    SqlRunner.run(sql)
  end

  def all_menu_items()
    sql = "SELECT * FROM menu_items WHERE eatery_id = #{self.id}"
    mi = SqlRunner.run(sql)
    mi_objects = mi.map{|mi| MenuItem.new(mi)}
    return mi_objects
  end

  def create_deal_for_category(day, deal_name,bur_cat)
    self.all_menu_items.each{ |mi|
      mi.create_deal(day, deal_name,bur_cat).save }
  end

  #duplicate of above, refacor out when found
  def add_deal_to_all_mi(day, deal_name,bur_cat)
    self.all_menu_items.each{|mi|
      mi.create_deal(day,deal_name,bur_cat).save}
  end

  def deals
    sql = "SELECT d.* FROM deals d
    INNER JOIN menu_items m
    ON d.menu_item_id=m.id
    WHERE m.eatery_id = #{@id} "

    deal_pgs = SqlRunner.run(sql)
    deal_obs_non_uniq = deal_pgs.map{|deal| Deal.new(deal)}
    uniq = []
    for deal in deal_obs_non_uniq 
      found_match = uniq.find{|entry| entry.deal_name == deal.deal_name}
    
      uniq << deal if !found_match
    end
    uniq.sort! {|x,y| x.day_id <=> y.day_id}
    return uniq
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM eateries"
    eateries = SqlRunner.run(sql)
    eateries_objects = eateries.map{|eatery| Eatery.new(eatery)}
    return eateries_objects
  end

  def self.all_without_first()
    sql = "SELECT * FROM eateries WHERE id NOT IN (1)"
    eateries = SqlRunner.run(sql)
    eateries_objects = eateries.map{|eatery| Eatery.new(eatery)}
    return eateries_objects
  end

  def self.find(id)
    sql = "SELECT * FROM eateries WHERE id = #{id}"
    eatery = SqlRunner.run(sql).first
    result = Eatery.new(eatery)
    return result    
  end

end