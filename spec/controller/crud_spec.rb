require_relative '../spec_helper'

describe 'posts controller' do
  it 'should process the GET route and make it redirect to the post index erb page' do
    get '/posts'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to AirBNL!')
  end

  it 'should process the post route and make it redirect to the post index erb page' do
    post '/posts/:id'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to include('Welcome to AirBNL!')
    end



    it 'should process the delete route and make it redirect to the post index erb page' do
      # delete '/delete_something', :params => with_a_param=true
      delete '/posts/:id/delete'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response).to be_ok
      expect(last_response.body).to include('Welcome to AirBNL!')
    end

    it 'should process the edit route and make it redirect to the post show erb page' do
      # delete '/delete_something', :params => with_a_param=true
      put '/posts/:id/edit'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response).to be_ok
      expect(last_response.body).to include('Created by')
    end

end