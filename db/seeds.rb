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
barbacoa = Burrito.new({
  'burrito_name' => 'Barbacoa',
  'burrito_cat' => classic.id
  })
chicken = Burrito.new({
  'burrito_name' => 'Chicken',
  'burrito_cat' => classic.id
  })
carnitas = Burrito.new({
  'burrito_name' => 'Carnitas',
  'burrito_cat' => classic_plus.id
  })
chorizo = Burrito.new({
  'burrito_name' => 'Chorizo',
  'burrito_cat' => classic_plus.id
  })
breakfast = Burrito.new({
  'burrito_name' => 'Breakfast',
  'burrito_cat' => classic_plus.id
  })
spicy_guiso = Burrito.new({
  'burrito_name' => 'Spicy Guiso',
  'burrito_cat' => deluxe.id
  })
juarez = Burrito.new({
  'burrito_name' => 'Juarez',
  'burrito_cat' => deluxe.id
  })
fish = Burrito.new({
  'burrito_name' => 'Fish',
  'burrito_cat' => deluxe.id
  })
steak_and_chorizo = Burrito.new({
  'burrito_name' => 'Steak and Chorizo',
  'burrito_cat' => special.id
  })

sofritas.save
barbacoa.save
chicken.save
carnitas.save
chorizo.save
breakfast.save
spicy_guiso.save
juarez.save
fish.save
steak_and_chorizo.save

cheap_core_burritos = [sofritas,barbacoa,chicken]
expensive_core_burritos = [carnitas,chorizo,breakfast]


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
  'burrito_id' => spicy_guiso.id,
  'price' => 9
  })
menu_item2 = MenuItem.new({
  'eatery_id' => el_cartel.id,
  'burrito_id' => juarez.id,
  'price' => 9
  })
menu_item3 = MenuItem.new({
  'eatery_id' => antojito.id,
  'burrito_id' => fish.id,
  'price' => 9
  })
menu_item4 = MenuItem.new({
  'eatery_id' => mariachi.id,
  'burrito_id' => steak_and_chorizo.id,
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