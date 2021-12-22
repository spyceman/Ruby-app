require "rails_helper"

describe Post do
    let(:attributes) do
      {
        title: "Post",
        body: "some text 123456",
        user_id: 1,
      }
    end
    
    let(:missing_title) { attributes.except(:title) }
    let(:missing_body) { attributes.except(:body) }
    let(:missing_user_id) { attributes.except(:user_id) }
    let(:invalid_body) { attributes.merge(body: "text") }
  
    it "is considered valid" do
      expect(Post.new(attributes)).to be_valid
    end

    it "is invalid without a title" do
      expect(Post.new(missing_title)).not_to be_valid
    end
  
    it "is invalid without a body" do
      expect(Post.new(missing_body)).not_to be_valid
    end
  
    it "is invalid without a user_id" do
      expect(Post.new(missing_user_id)).not_to be_valid
    end

    it "is invalid with body shorter than 10 symbols" do
      expect(Post.new(invalid_body)).not_to be_valid
    end
  end