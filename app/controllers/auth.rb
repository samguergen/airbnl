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

get '/user/:id/edit' do
  @the_user = User.find_by(id: params[:id])
  if session[:user_id] == @the_user.id
    erb :"user_edit"
  else
    "Sorry, you can only edit your own profile!"
  end
end

# put '/posts/:id' do
#   @the_post = Post.find_by(id: params[:id])
#   if @the_post
#     @the_post.title = params[:title]
#     @the_post.description = params[:description]
#     @the_post.location = params[:location]
#     @the_post.price = params[:price]
#     @the_post.start_date = params[:startdate]
#     @the_post.end_date = params[:enddate]
#     @the_post.photo_url = params[:photourl]

#     if @the_post.save!
#       redirect "/posts/#{@the_post.id}"
#     else
#       [500,"There is a problem with the information you are updating."]
#     end
#   else
#     [404, "This post couldn't be updated."]
#   end
# end




delete '/user/:id/delete' do
  @user_to_delete = User.find_by(id: params[:id])
  if @user_to_delete.id == session[:user_id]
    @user_to_delete.destroy!
    redirect "/logout"
  else
    "Sorry, you can only delete your own profile!"
  end
end