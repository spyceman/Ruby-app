require "rails_helper"

describe Comment do
    let(:attributes) do
      {
        author: "Alex",
        body: "some text 123456",
        post_id: 1
      }
    end
    
    let(:missing_author) { attributes.except(:author) }
    let(:missing_body) { attributes.except(:body) }
    let(:missing_post_id) { attributes.except(:post_id) }
    let(:invalid_body) { attributes.merge(body: "text") }
  
    it "is considered valid" do
      expect(Comment.new(attributes)).to be_valid
    end

    it "is invalid without an author" do
      expect(Comment.new(missing_author)).not_to be_valid
    end
  
    it "is invalid without a body" do
      expect(Comment.new(missing_body)).not_to be_valid
    end
  
    it "is invalid without a post_id" do
      expect(Comment.new(missing_post_id)).not_to be_valid
    end

    it "is invalid with body shorter than 10 symbols" do
      expect(Comment.new(invalid_body)).not_to be_valid
    end
  end