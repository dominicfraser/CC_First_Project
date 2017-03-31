 require('minitest/autorun')
 require('minitest/rg')
 require_relative('../models/menu_item')
 require_relative('../models/burrito')

class TestMenuItem < MiniTest::Test

def setup
  @burrito1 = Burrito.new({
    'burrito_name' => 'burrito6',
    'id' => 1
    })
  @burrito6 = Burrito.new({
    'burrito_name' => 'burrito6',
    'id' => 6
    })
  @burrito7 = Burrito.new({
    'burrito_name' => 'burrito7',
    'id' => 7
    })
  @burrito8 = Burrito.new({
    'burrito_name' => 'burrito8',
    'id' => 8
    })
  @expensive_core_burritos = [@burrito6,@burrito7,@burrito8]
  @menu_item1 = MenuItem.new({
    'eatery_id' => 1,
    'burrito_id' => @burrito7.id,
    'price' => 9,
    'id' => 1
    })
end

def test_menu_item_is_in_a_selection?
    assert_equal(true,@menu_item1.is_in_a_selection?(@expensive_core_burritos))
end

end