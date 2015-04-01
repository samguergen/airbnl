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
  erb :"/post/edit"
end

put '/posts/:id' do
  @the_post = Post.find_by(id: params[:id])
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