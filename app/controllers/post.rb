get '/posts' do
  @all_posts = Post.all
  erb :"post/index"
end

get '/posts/new' do
  if session[:user_id]
    erb :"post/new"
  else
    "Sorry, only AirBnL members can create new posts."
  end

end

get '/posts/:id' do
  @the_post = Post.find_by(id: params[:id])
  erb :"post/show"
end

get '/posts/:id/edit' do
  @the_post = Post.find_by(id: params[:id])
  if session[:user_id] == @the_post.user_id
    erb :"post/edit"
  else
    "Sorry, you can only edit your own posts!"
  end
end


put '/posts/:id' do
  @the_post = Post.find_by(id: params[:id])
  if @the_post
    # When you see things like this, you might want to think "let's extract
    # this work to a method...e.g.
    #
    @the_post.update_from_params(params)

    if @the_post.save!
      redirect "/posts/#{@the_post.id}"
    else
      [500,"There is a problem with the information you are updating."]
    end
  else
    [404, "This post couldn't be updated."]
  end
end

post '/posts' do
  @new_post = Post.new(title: params[:title], location: params[:location], description: params[:description], price: params[:price], start_date: params[:startdate], end_date: params[:enddate], photo_url: params[:photourl])
  if @new_post.save
    redirect "/posts/#{@new_post.id}"
  else
    [404, "This post couldn't be added."]
  end
end


delete '/posts/:id/delete' do
  @post_to_delete = Post.find_by(id: params[:id])
  if @post_to_delete.user_id == session[:user_id]
    @post_to_delete.destroy!
    redirect "/posts"
  else
    "Sorry, you can only delete your own posts!"
  end
end
