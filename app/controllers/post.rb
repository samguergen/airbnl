get '/posts' do
  @all_posts = Post.all
  erb :"post/index"
end

get '/posts/new' do
  erb :"post/new"
end

get '/posts/:id' do
  @the_post = Post.find_by(id: params[:id])
  erb :"post/show"
end

get '/posts/:id/edit' do
  @the_post = Post.find_by(id: params[:id])
  erb :"post/edit"
end

put '/posts/:id' do
  @the_post = Post.find_by(id: params[:id])
  if @the_post
    @the_post.title = params[:title]
    @the_post.description = params[:description]
    @the_post.location = params[:location]
    @the_post.price = params[:price]
    @the_post.start_date = params[:startdate]
    @the_post.end_date = params[:enddate]
    @the_post.photo_url = params[:photourl]

    if @the_post.save!
      redirect "/posts"
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
  @post_to_delete.destroy!
  redirect "/posts"
end