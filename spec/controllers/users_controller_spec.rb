require "rails_helper"

RSpec.describe "Users", type: :request do

    describe "GET users#index" do
      it "should get index" do
        users = User.all
        get '/users'
        json = JSON.parse(response.body)
        expect(response).to eq(users)
      end
    end

    describe "GET users#show" do
    it "should get user" do
        user = User.find(1)
        get '/users/1'
        json = JSON.parse(response.body)
        expect(json).to eql(user)
    end
end

    describe "POST users#create" do
        let(:attributes) do
            {
              email: "User@gmail.com",
              password: "qwerty123456",
            }
          end
        it 'create user with valid attributes' do
            user = User.new(attributes)
            post '/users', :params => user    
            json = JSON.parse(response.body)    
            expect(json).to eq(user)
        end
      end

      describe 'PUT users#update' do
        it 'should update the user' do    
          new_user_params = { user: {
            email: 'example111@gmail.com',
            password: 'qwerty',
          }}
          put "/users/1", :params => new_user_params
          json = JSON.parse(response.body)
          expect(json).to eq(new_user_params)
        end
     end

     it "should delete user" do
        delete '/users/2'
        expect(response.status).to eql(204)
    end

  end