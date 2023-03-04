class ApplicationController < Sinatra::Base

  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakeries = Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end
  
  get '/baked_goods/by_price' do
    bakedGoods = BakedGood.all.order(:price)
    bakedGoods.to_json
  end

  get '/baked_goods/most_expensive' do
    bakedGoods = BakedGood.by_price.first
    bakedGoods.to_json
  end

end
