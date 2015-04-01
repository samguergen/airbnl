
get '/posts/:id/comments' do
  @the_post = Post.find_by(id: params[:id])
  erb :"comment/index"
end

get '/posts/:id/comments/new' do
  @the_post = Post.find_by(id: params[:id])
    erb :"comment/new"
end

get '/posts/:id/comments/:commentid/edit' do
  @the_post = Post.find_by(id: params[:id])
  @the_comment = Comment.find_by(id: params[:commentid], post_id: @the_post.id)
  erb :"comment/edit"
end

put '/posts/:id/comments/:commentid' do
  @the_post = Post.find_by(id: params[:id])
end

post '/posts/:id/comments' do
  @the_post = Post.find_by(id: params[:id])
end


delete '/posts/:id/comments/:commentid/delete' do
  @the_post = Post.find_by(id: params[:id])
  @the_comment = Comment.find_by(id: params[:commentid], post_id: @the_post.id)
  @the_comment.destroy!

end