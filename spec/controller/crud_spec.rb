require_relative '../spec_helper'

describe 'posts controller' do
  it 'should process the GET route and redirect to the /posts erb page' do
    get '/posts'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to AirBNL!')
  end

  it 'should process the post /posts route' do
    post '/posts'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to include('The best')
    end



    it 'should process the delete /posts/:id/delete route' do
      # delete '/delete_something', :params => with_a_param=true
      delete '/delete_something'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response).to be_ok
      expect(last_response.body).to include('The best')
    end

end