get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'/restaurants/index'
end

get '/restaurants/new' do
  if logged_in?
    erb :'/restaurants/new'
  else
    @errors = ["You must be logged in to create a submission!"]
    erb :'/login/new'
  end
end

post '/restaurants' do
  @restaurant = Restaurant.new(params[:restaurant])
  @restaurant.creator_id = current_user.id
  @restaurants = Restaurant.all
  if @restaurant.save
    redirect '/restaurants'
  else
    @errors = @restaurant.errors.full_messages
    erb :'/restaurants/new'
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @reviews = @restaurant.reviews
  erb :'restaurants/show'
end

post '/restaurants/:id/reviews' do
  @restaurant = Restaurant.find(params[:id])
  @review = Review.new(reviewer_id: current_user.id, restaurant_id: params[:id], rating: params[:rating], body: params[:body])
  @reviews = @restaurant.reviews
  if logged_in?
    if @review.save
      redirect "/restaurants/#{@restaurant.id}"
    else
      @errors = @review.errors.full_messages
      erb :'/restaurants/show'
    end
  else
    @errors = ["You must be logged in to leave a comment!"]
    erb :'/users/new'
  end
end

get '/restaurants/:id/edit' do
  @restaurant = Restaurant.find(params[:id])
  if current_user.id == @restaurant.creator_id
    erb :'/restaurants/edit'
  else
    redirect '/'
  end
end

put '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  if @restaurant.update_attributes(params[:restaurant])
    redirect "/"
  else
    @errors = @restaurant.errors.full_messages
    erb :'/restaurants/edit'
  end
end

delete '/restaurants/:id' do
  restaurant = Restaurant.find(params[:id])
  if current_user.id == restaurant.creator_id
    restaurant.destroy
    redirect '/'
  else
    redirect '/'
  end
end


