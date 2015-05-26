  describe "Post Controller" do
    context "index page" do
      it "returns all post objects" do
        get '/posts'
        expect(assigns(:all_posts)).to eq Post.all
      end

      it 'should process the GET route and redirect to index erb page' do
        get '/posts'
        expect(last_response).to be_redirect
        follow_redirect!
        expect(last_response).to be_ok
        expect(last_response.body).to include('Latest rentals')
      end
   end

    xit "#new" do
      get :new
      expect(assigns(:post)).to eq(Post.last)
    end

  end