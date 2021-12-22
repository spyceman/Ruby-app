class CommentsController < ApplicationController
    authorize_resource
    before_action :authorized, except: [:show, :index]
    before_action :find_post

    def create
        @comment = @post.comments.create(params.require(:comment).permit(:author, :body))
    end

    def show
        @comment = @post.comments.find(params[:id])
        render json: @comment
    end

    def index
        @comments = @post.comments.all
        render json: @comments
    end

    def update
        @comment = @post.comments.find(params[:id])
        @comment.update(params.require(:comment).permit(:author, :body))
    end

    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
    end

    private

    def find_post
     @post = Post.find(params[:post_id]) 
    end

end
