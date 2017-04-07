require_relative('../models/burrito')
require_relative('../models/eatery')
require_relative('../models/deal')
require_relative('../models/menu_item')
require_relative('../models/food_category')
require('pry')

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
  @burritos = Burrito.all
# USE "" when string interpolation
  params['add'] == 'y' ? (redirect "/admin/menu_items/new/#{@burrito.id}") : erb(:'admin/burritos/index', :layout => :admin_layout)
  #erb(:'admin/burrito/create')
end

post '/admin/burritos/:id/delete' do
  @burrito = Burrito.find(params[:id])
  erb(:'admin/burritos/destroy')
  redirect 'admin/burritos/index'
end

##MENU ITEMS
get '/admin/menu_items/new/:bid' do
  @eateries = Eatery.all 
  @burritos = Burrito.all
  @burrito_id = params[:bid].to_i
  erb(:'admin/menu_items/new', :layout => :admin_layout)
end

post '/admin/menu_items' do

if params['eatery_id'] == 1
  MenuItem.new_all(params['burrito_id'],params['price'])
else
  @menu_item = MenuItem.new(params)
  @menu_item.save
end

params['add'] == 'y' ? (redirect "/admin/menu_items/new/0") : erb(:'admin/main_menu', :layout => :admin_layout)
end


##EATERIES
get '/admin/eateries/index' do
  @eateries = Eatery.all_without_first
  erb(:'admin/eateries/index', :layout => :admin_layout)
end

get '/admin/eateries/new' do
  erb(:'admin/eateries/new', :layout => :admin_layout)
end

get '/admin/eateries/:id/edit' do
  @eatery = Eatery.find(params[:id])
  erb(:'admin/eateries/edit', :layout => :admin_layout)
end

post '/admin/eateries/:id' do
  @eatery = Eatery.new(params)
  @eatery.update #takes the id from it being thrown in in the edit section
  redirect 'admin/eateries/index'
end


post '/admin/eateries' do
  @eatery = Eatery.new(params)
  @eatery.save
  @eateries = Eatery.all_without_first
  erb(:'admin/eateries/index', :layout => :admin_layout)
end

post '/admin/eateries/:id/delete' do
  @eatery = Eatery.find(params[:id])
  erb(:'admin/eateries/destroy')
  redirect 'admin/eateries/index'
end

##DEALS
get '/admin/deals/index' do
  @deals = Deal.all_uniq_names
  erb(:'admin/deals/index', :layout => :admin_layout)
end

post '/admin/deals/:id/delete' do
  Deal.delete_all_deals_of_same_name(params[:id])
  redirect 'admin/deals/index'
end

get '/admin/deals/s_e' do
  @eateries = Eatery.all_without_first
  erb(:'admin/deals/s_e', :layout => :admin_layout)
end

post '/admin/deals/new' do
  @eatery = Eatery.find(params['id'])
  @days = Day.all_without_first
  @categories = FoodCategory.all

  erb(:'admin/deals/new', :layout => :admin_layout)
end

post '/admin/deals/:eid' do
  @eatery = Eatery.find(params[:eid])  
  @deals = Deal.all_uniq_names
  @day = Day.find(params[:day_id])
  @bur_cat = FoodCategory.find(params[:burrito_cat])
  @operator = params['operator']
  @operand = params['operand'].to_f
  @deal_name = "#{params[:deal_name]}"

  @eatery.create_deal_for_category(@day,@deal_name, @bur_cat, @operator, @operand) 

  redirect 'admin/deals/index'
end