require_relative('../db/sql_runner')

class Menu_Item

  attr_reader :id, :eatery_id, :burrito_id, :price

  def initialize(mi_hash)
    @id = mi_hash['id'].to_i
    @eatery_id = mi_hash['eatery_id'].to_i
    @burrito_id = mi_hash['burrito_id'].to_i
    @price = mi_hash['price'].to_f.round(4)
  end



end