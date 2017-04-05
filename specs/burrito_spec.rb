 require('minitest/autorun')
 require('minitest/rg')
 require_relative('../models/menu_item')
 require_relative('../models/burrito')
 require_relative('../models/eatery')

class TestBurrito < MiniTest::Test

  def setup
    @sofritas = Burrito.new({
      'burrito_name' => 'breakfast',
      'id' => 1
      })
    @barbacoa = Burrito.new({
      'burrito_name' => 'breakfast',
      'id' => 2
      })
    @el_cartel = Eatery.new({
      'eatery_name' => 'el_cartel',
      'id' => 1
      })
    @antojito = Eatery.new({
      'eatery_name' => 'Antojito',
      'id' => 2
      })
    @menu_item1 = MenuItem.new({
      'eatery_id' => @el_cartel.id,
      'burrito_id' => @sofritas.id,
      'price' => 9,
      'id' => 1
      })
    @menu_item2 = MenuItem.new({
      'eatery_id' => @el_cartel.id,
      'burrito_id' => @barbacoa.id,
      'price' => 9,
      'id' => 2
      })
  end

end