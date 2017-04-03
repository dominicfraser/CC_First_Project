require_relative('../models/burrito')
require_relative('../models/eatery')
require_relative('../models/deal')
require_relative('../models/menu_item')
require_relative('../models/food_category')

##BURRITOS
get '/admin/burritos/index' do
  @burritos = Burrito.all
  erb(:'admin/burritos/index', :layout => :admin_layout)
end

get '/admin/burritos/new' do
  @eateries = Eatery.all
  @food_categories = FoodCategory.all_without_first
  erb(:'admin/burritos/new', :layout => :admin_layout)
end

post '/admin/burrito' do
  @burrito = Burrito.new(params)
  @burrito.save

  params['add'] == 'y' ? erb(:'admin/menu_items/new', :layout => :admin_layout) : erb(:'admin/main_menu', :layout => :admin_layout) 
  #erb(:'admin/burrito/create')
end

##EATERIES
get '/admin/eateries/index' do
  @eateries = Eatery.all_without_first
  erb(:'admin/eateries/index', :layout => :admin_layout)
end

##DEALS
get '/admin/deals/index' do
  @deals = Deal.all_uniq_names
  erb(:'admin/deals/index', :layout => :admin_layout)
end