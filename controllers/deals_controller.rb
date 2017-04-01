require_relative('../models/deal')

get '/deals/:id' do
@deal = Deal.find(params[:id])
erb(:'deals/show')
end

