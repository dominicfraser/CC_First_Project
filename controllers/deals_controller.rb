require_relative('../models/deal')

get '/deals/:id/:eid/:did' do
@deal = Deal.find(params[:id])
@eatery = Eatery.find(params[:eid])
@day = Day.find(params[:did])
erb(:'deals/show_burritos')
end

