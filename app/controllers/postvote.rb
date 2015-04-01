post '/posts/:id/upvote' do
  @the_post = Post.find_by(:id => params[:id])
  if User.find_by(id: session[:user_id])
    @upvote = Postvote.create(:post_id => @the_post.id, :upvote => 1, :downvote => 0 ,:user_id => session[:user_id])
    # erb :"_postvote", :layout => false
    redirect "/posts/#{@the_post.id}"
  else
    "Sorry, only AirBnl members can vote!"
  end
end


post '/posts/:id/downvote' do
  @the_post = Post.find_by(:id => params[:id])
  if User.find(session[:user_id])
    @downvote = Postvote.create(:post_id => @the_post.id, :upvote => 0, :downvote => 1, :user_id => session[:user_id])
    # erb :"_postvote", :layout => false
    redirect "/posts/#{@the_post.id}"
  else
    "Sorry, only AirBnl members can vote!"
  end
end