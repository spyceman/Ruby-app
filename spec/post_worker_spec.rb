require 'rails_helper'

  describe PostWorker do
    let(:attributes) do
      {
        title: "Post",
        body: "some text 123456",
        user_id: 1,
      }
    end
    it "is considered valid" do
      expect(Post.new(attributes)).to be_valid
    end
end

