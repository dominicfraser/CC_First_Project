require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/deals_controller')
require_relative('controllers/eateries_controller')
require_relative('controllers/admin_controller')
require_relative('models/day')
require_relative('models/eatery')
require_relative('models/deal')

get '/' do 
  erb(:log_on, :layout => :no_nav) 
end

get '' do
  redirect '/'
end

get '/deal_selection/filter' do
  @days = Day.all
  @eateries = Eatery.all
  erb(:'deal_selection/filter')
end

get '/deal_selection/filtered_deals' do
  @day = Day.find(params['day_id'])
  @eatery = Eatery.find(params['eatery_id'])
  @deals = @day.find_uniq_deals_by_name_at(@eatery)
  @all_uniq_deals_day = Deal.all_uniq_names_on(@day)

  redirect '/deals/index' unless @eatery.id != 1 || @day.id != 1 
  erb(:'deal_selection/filtered_deals')
end

get '/admin/main_menu' do
  erb(:'admin/main_menu', :layout => :admin_layout)
end