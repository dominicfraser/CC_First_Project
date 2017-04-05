require_relative('../models/day')
require_relative('../models/eatery')
require_relative('../models/burrito')
require_relative('../models/menu_item')
require_relative('../models/deal')
require_relative('../models/food_category')

require('pry-byebug')

### MUST BE FIRST SEEDED
all_week = Day.new({
  'day_name' => 'All Days'
  })
all_week.save

all_eateries = Eatery.new({
  'eatery_name' => 'All Eateries',
  })
all_eateries.save

all_categories = FoodCategory.new({
  'category' => 'All'
  })
all_categories.save
###

classic = FoodCategory.new({
  'category' => 'Classic'
  })
classic_plus = FoodCategory.new({
  'category' => 'Classic Plus'
  })
deluxe = FoodCategory.new({
  'category' => 'Deluxe'
  })
special = FoodCategory.new({
  'category' => 'Special'
  })
classic.save
classic_plus.save
deluxe.save
special.save

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
new_years_eve_2017 = Day.new({
  'day_name' => 'NYE 2017'
  })

monday.save
tuesday.save
wednesday.save
thursday.save
friday.save
saturday.save
sunday.save
new_years_eve_2017.save

el_cartel = Eatery.new({
  'eatery_name' => 'El Cartel'
  })
antojito = Eatery.new({
  'eatery_name' => 'Antojito'
  })
mariachi = Eatery.new({
  'eatery_name' => 'Mariachi'
  })

el_cartel.save
antojito.save
mariachi.save

sofritas = Burrito.new({
  'burrito_name' => 'Sofritas',
  'burrito_cat' => classic.id
  })
burrito2 = Burrito.new({
  'burrito_name' => 'burrito2',
  'burrito_cat' => classic.id
  })
burrito3 = Burrito.new({
  'burrito_name' => 'burrito3',
  'burrito_cat' => classic.id
  })
burrito4 = Burrito.new({
  'burrito_name' => 'burrito4',
  'burrito_cat' => classic_plus.id
  })
burrito5 = Burrito.new({
  'burrito_name' => 'burrito5',
  'burrito_cat' => classic_plus.id
  })
burrito6 = Burrito.new({
  'burrito_name' => 'burrito6',
  'burrito_cat' => classic_plus.id
  })
burrito7 = Burrito.new({
  'burrito_name' => 'burrito7',
  'burrito_cat' => deluxe.id
  })
burrito8 = Burrito.new({
  'burrito_name' => 'burrito8',
  'burrito_cat' => deluxe.id
  })
burrito9 = Burrito.new({
  'burrito_name' => 'burrito9',
  'burrito_cat' => deluxe.id
  })
sofritas0 = Burrito.new({
  'burrito_name' => 'sofritas0',
  'burrito_cat' => special.id
  })

sofritas.save
burrito2.save
burrito3.save
burrito4.save
burrito5.save
burrito6.save
burrito7.save
burrito8.save
burrito9.save
sofritas0.save

cheap_core_burritos = [sofritas,burrito2,burrito3]
expensive_core_burritos = [burrito4,burrito5,burrito6]


cheap_core_burritos.each{|burrito| 
  Eatery.all_without_first.each{ |eatery|
     MenuItem.new({
    'eatery_id' => eatery.id,
    'burrito_id' => burrito.id,
    'price' => 7.5
    }).save
  }
}
expensive_core_burritos.each{|burrito| 
  Eatery.all_without_first.each{ |eatery|
     MenuItem.new({
    'eatery_id' => eatery.id,
    'burrito_id' => burrito.id,
    'price' => 8
    }).save
  }
}

menu_item1 = MenuItem.new({
  'eatery_id' => el_cartel.id,
  'burrito_id' => burrito7.id,
  'price' => 9
  })
menu_item2 = MenuItem.new({
  'eatery_id' => el_cartel.id,
  'burrito_id' => burrito8.id,
  'price' => 9
  })
menu_item3 = MenuItem.new({
  'eatery_id' => antojito.id,
  'burrito_id' => burrito9.id,
  'price' => 9
  })
menu_item4 = MenuItem.new({
  'eatery_id' => mariachi.id,
  'burrito_id' => sofritas0.id,
  'price' => 10
  })
menu_item1.save
menu_item2.save
menu_item3.save
menu_item4.save

##all burritos at a certain eatery on a certain day##
#el_cartel Monday 20% 
el_cartel.create_deal_for_category(monday,'20% off all Burritos at El Cartel on Mondays',all_categories,'*',0.8)
#antojito Wednesday 10% 
antojito.create_deal_for_category(wednesday,'10% off all Burritos at Antojito on Wednesdays',all_categories,'*',0.9)
#mariachi Friday 15%
mariachi.create_deal_for_category(friday,'15% off all Burritos at Mariachi on Fridays',all_categories,'*',0.85)
#el_cartel Thursday £1 
el_cartel.create_deal_for_category(thursday,'£1 off all Burritos at El Cartel on Thursdays',all_categories,'-',1)
#antojito Sunday 50p
antojito.create_deal_for_category(sunday,'50p off all Burritos at Antojito on Sundays',all_categories,'-',0.5)
#mariachi Tuesday £1.50 
mariachi.create_deal_for_category(tuesday,'£1.50 off all Burritos at Mariachi on Tuesdays',all_categories,'-',1.5)
#el_cartel Tuesday 2for1
el_cartel.create_deal_for_category(tuesday,'2 for 1 on all Burritos at El Cartel on Tuesdays',all_categories,'special',0)

##selection of burritos at a certain eatery on a certain day##
#antojito Thursday CP same as C
antojito.create_deal_for_category(thursday,'Classic Plus same price as Classic at Antojito on Thursdays',classic_plus,'special',0)

#mariachi Monday specials are reduced by £1   
mariachi.create_deal_for_category(monday,'Specials are all reduced by £1 at Mariachi on Mondays',special,'-',1)


binding.pry
nil