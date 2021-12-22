require "rails_helper"

RSpec.describe "Posts", type: :request do

    describe "GET posts#index" do
      it "should get index" do
        posts = Post.all
        get '/posts'
        json = JSON.parse(response.body)
        expect(response).to eq(posts)
      end
    end

    describe "GET posts#show" do
    it "should get post" do
        post = Post.find(1)
        get '/posts/1'
        json = JSON.parse(response.body)
        expect(json).to eql(post)
    end
end

    describe "POST posts#create" do
        let(:attributes) do
            {
              title: "Title",
              body: "some text",
              user_id: 1
            }
          end
        it 'create post with valid attributes' do
            post = Post.new(attributes)
            post '/posts', :params => post    
            json = JSON.parse(response.body)    
            expect(json).to eq(post)
        end
      end

      describe 'PUT posts#update' do
        it 'should update the post' do    
          new_post_params = { post: {
            title: "Title",
            body: "other text",
            user_id: 1
          }}
          put "/posts/1", :params => new_post_params
          json = JSON.parse(response.body)
          expect(json).to eq(new_post_params)
        end
     end

     it "should delete post" do
        delete '/posts/2'
        expect(response.status).to eql(204)
    end

  end