require_relative('../models/burrito')
require_relative('../models/eatery')
require_relative('../models/deal')

get '/admin/burritos/index' do
  @burritos = Burrito.all
  erb(:'admin/burritos/index', :layout => :admin_layout)
end

get '/admin/eateries/index' do
  @eateries = Eatery.all_without_first
  erb(:'admin/eateries/index', :layout => :admin_layout)
end

get '/admin/deals/index' do
  @deals = Deal.all_uniq_names
  erb(:'admin/deals/index', :layout => :admin_layout)
end