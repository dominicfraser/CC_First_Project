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

post '/admin/burritos' do
  @burrito = Burrito.new(params)
  @burrito.save
# USE "" when string interpolation
  params['add'] == 'y' ? (redirect "/admin/menu_items/new/#{@burrito.id}") : erb(:'admin/main_menu', :layout => :admin_layout)
  #erb(:'admin/burrito/create')
end

post '/admin/burritos/:id/delete' do
  @burrito = Burrito.find(params[:id])
  erb(:'admin/burritos/destroy')
  redirect 'admin/main_menu'
end

##MENU ITEMS
get '/admin/menu_items/new/:bid' do
  @eateries = Eatery.all 
  @burritos = Burrito.all
  @burrito_id = params[:bid].to_i
  erb(:'admin/menu_items/new', :layout => :admin_layout)
end

post 'admin/menu_items' do

if params['eatery_id'] == 1
  MenuItem.new_all(params['burrito_id'],params['price'])
else
  @menu_item = MenuItem.new(params)
  @menu_item.save
end

params['add'] == 'y' ? (redirect "/admin/menu_items/new/#{@burrito.id}") : erb(:'admin/main_menu', :layout => :admin_layout)
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