get '/login' do
  erb :"auth/login", layout: false
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect "/posts"
  else
    redirect "/login"
  end
end

get '/signup' do
  erb :"auth/signup", layout: false
end

post '/signup' do
  new_user = User.new(params[:user])
  if new_user.save!
    session[:user_id] = new_user.id
    redirect "/posts"
  else
    redirect "/signup"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect "/posts"
end


get '/user/:id' do
  @the_user = User.find_by(id: params[:id])
  erb :"user_show"
end


delete '/user/:id/delete' do
  @user_to_delete = User.find_by(id: params[:id])
  if @user_to_delete.id == session[:user_id]
    @user_to_delete.destroy!
    redirect "/posts"
  else
    "Sorry, you can only delete your own profile!"
  end
end