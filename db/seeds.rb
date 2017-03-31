require_relative('../models/day')
require_relative('../models/eatery')
require_relative('../models/burrito')
require_relative('../models/menu_item')
require_relative('../models/deal')

require('pry-byebug')

monday = Day.new({
  'day_name' => 'Monday'
  })
tuesday = Day.new({
  'day_name' => 'Tuesday'
  })
wednesday = Day.new({
  'day_name' => 'Wednesday'
  })
thursday = Day.new({
  'day_name' => 'Thursday'
  })
friday = Day.new({
  'day_name' => 'Friday'
  })
saturday = Day.new({
  'day_name' => 'Saturday'
  })
sunday = Day.new({
  'day_name' => 'Sunday'
  })

monday.save
tuesday.save
wednesday.save
thursday.save
friday.save
saturday.save
sunday.save

eatery1 = Eatery.new({
  'eatery_name' => 'eatery1'
  })
eatery2 = Eatery.new({
  'eatery_name' => 'eatery2'
  })
eatery3 = Eatery.new({
  'eatery_name' => 'eatery3'
  })

eatery1.save
eatery2.save
eatery3.save

burrito1 = Burrito.new({
  'burrito_name' => 'burrito1'
  })
burrito2 = Burrito.new({
  'burrito_name' => 'burrito2'
  })
burrito3 = Burrito.new({
  'burrito_name' => 'burrito3'
  })
burrito4 = Burrito.new({
  'burrito_name' => 'burrito4'
  })
burrito5 = Burrito.new({
  'burrito_name' => 'burrito5'
  })
burrito6 = Burrito.new({
  'burrito_name' => 'burrito6'
  })
burrito7 = Burrito.new({
  'burrito_name' => 'burrito7'
  })
burrito8 = Burrito.new({
  'burrito_name' => 'burrito8'
  })
burrito9 = Burrito.new({
  'burrito_name' => 'burrito9'
  })
burrito10 = Burrito.new({
  'burrito_name' => 'burrito10'
  })

burrito1.save
burrito2.save
burrito3.save
burrito4.save
burrito5.save
burrito6.save
burrito7.save
burrito8.save
burrito9.save
burrito10.save

cheap_core_burritos = [burrito1,burrito2,burrito3]
expensive_core_burritos = [burrito4,burrito5,burrito6]


cheap_core_burritos.each{|burrito| 
  Eatery.all.each{ |eatery|
     MenuItem.new({
    'eatery_id' => eatery.id,
    'burrito_id' => burrito.id,
    'price' => 7.5
    }).save
  }
}
expensive_core_burritos.each{|burrito| 
  Eatery.all.each{ |eatery|
     MenuItem.new({
    'eatery_id' => eatery.id,
    'burrito_id' => burrito.id,
    'price' => 8
    }).save
  }
}

menu_item1 = MenuItem.new({
  'eatery_id' => eatery1.id,
  'burrito_id' => burrito7.id,
  'price' => 9
  })
menu_item2 = MenuItem.new({
  'eatery_id' => eatery1.id,
  'burrito_id' => burrito8.id,
  'price' => 9
  })
menu_item3 = MenuItem.new({
  'eatery_id' => eatery2.id,
  'burrito_id' => burrito9.id,
  'price' => 9
  })
menu_item4 = MenuItem.new({
  'eatery_id' => eatery3.id,
  'burrito_id' => burrito10.id,
  'price' => 10
  })
menu_item1.save
menu_item2.save
menu_item3.save
menu_item4.save

binding.pry
nil