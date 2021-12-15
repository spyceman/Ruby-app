class CommentsController < ApplicationController
    before_action :authorized, except: [:show, :index]

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(params.require(:comment).permit(:author, :body))
    end

    def show
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        render json: @comment
    end

    def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments.all
        #@comments = @post.comments.page(params[:page]).per(10)
        render json: @comments
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.update(params.require(:comment).permit(:author, :body))
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
    end
end
