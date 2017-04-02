require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/deals_controller')
require_relative('controllers/eateries_controller')
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

get '/deal_selection/filtered_deals/:eid/:did' do
  @day = Day.find(params['day_id'])
  @eatery = Eatery.find(params['eatery_id'])
  @deals = @day.find_uniq_deals_by_name_at(@eatery)
  @all_uniq_deals_day = Deal.all_uniq_names_on(@day)

  redirect 'deals/index' unless params[:eid] != 1 && params[:did] != 1 
  erb(:'deal_selection/filtered_deals')


end