require "rails_helper"

RSpec.describe "Comments", type: :request do

    describe "GET comments#index" do
      it "should get index" do
        comments = Comment.all
        get '/comments'
        json = JSON.parse(response.body)
        expect(response).to eq(comments)
      end
    end

    describe "GET comments#show" do
    it "should get comment" do
        comment = Comment.find(1)
        get '/comments/1'
        json = JSON.parse(response.body)
        expect(json).to eql(comment)
    end
end

    describe "POST comments#create" do
        let(:attributes) do
            {
              author: "author",
              body: "some text",
              post_id: 2
            }
          end
        it 'creates comment with valid attributes' do
            comment = Comment.new(attributes)
            post '/comments/1', :params => comment    
            json = JSON.parse(response.body)    
            expect(json).to eq(comment)
        end
      end

      describe 'PUT comments#update' do
        it 'should update the comment' do    
          new_comment_params = { comment: {
            author: "author",
            body: "other text",
            post_id: 2
          }}
          put "/comments/1/1", :params => new_comment_params
          json = JSON.parse(response.body)
          expect(json).to eq(new_comment_params)
        end
     end

     it "should delete comment" do
        delete '/comments/1/1'
        expect(response.status).to eql(204)
    end

  end