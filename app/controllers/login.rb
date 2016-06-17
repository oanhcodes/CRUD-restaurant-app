get '/login/new' do
  erb :'/login/new'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if !user.nil?
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/login/new'
    end
  else
    @errors = ["Sorry, the credentials provided do not match"]
    erb :'/login/new'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
