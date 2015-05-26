 require_relative '../spec_helper'

  describe "PostController" do

  context "GET '/'" do
    it "loads homepage" do
      get '/'
      expect(last_response).to be_redirect
    end
  end


    context "GET '/posts'" do
      xit "returns all post objects" do
        get "/posts"
        expect(assigns(:all_posts)).to eq Post.all
      end


      xit 'should process the GET route and redirect to index erb page' do
        get "/posts"
        # response.should be_successful
        #  response.should render_template("success")
        # expect(last_response).to be_ok
        # expect(last_response.body).to include('Latest Rentals')
      end
   end


   context "GET '/login'" do
      it "returns the login form" do
        get '/login'
        expect(last_response).to be_ok
        expect(last_response.body).to include('Login')
      end
    end


   context "GET '/signup'" do
      it "returns the signup form" do
        get '/signup'
        expect(last_response).to be_ok
        expect(last_response.body).to include('Create your account')
      end
    end

   context "GET '/posts/new'" do
      it "returns an error message if user not logged in" do
        get '/posts/new'
        expect(last_response).to be_ok
        expect(last_response.body).to eq('Sorry, only AirBnL members can create new posts.')
      end
    end

    xit "#new" do
      get :new
      expect(assigns(:post)).to eq(Post.last)
    end

  end