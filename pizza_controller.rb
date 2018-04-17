require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative("./models/pizza_order.rb")


#index
get "/pizza-orders" do
  @orders = PizzaOrder.all()
  erb(:index)
end

#new
get "/pizza-orders/new" do
  erb(:new)
end

#show
get "/pizza-orders/:id" do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

#create
post "/pizza-orders" do
  order = PizzaOrder.new(params)
  order.save()
  redirect to "/pizza-orders"
end

#edit
get "/pizza-orders/:id/edit" do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
  # redirect to "/pizza-orders/"
  end

#update
post "/pizza-orders/:id/edit" do
  order = PizzaOrder.new(params)
  order.update()
  redirect to "/pizza-orders"
end

#destroy
post "/pizza-orders/:id/delete" do
  order = PizzaOrder.new(params)
  order.delete()
  redirect to "/pizza-orders"
end
