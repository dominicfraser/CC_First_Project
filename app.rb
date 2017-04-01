require('sinatra')
require('sinatra/contrib/all')
# require_relative('controllers/deals_controller')
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
  @deal = @day.find_all_deals(@eatery)
  erb(:'deal_selection/filtered_deals')
end