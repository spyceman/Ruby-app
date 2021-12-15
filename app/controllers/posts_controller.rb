class PostsController < ApplicationController
    before_action :authorized, except: [:show, :index, :search]

    def create 
        @post = Post.new(post_params)
        @post.save
    end

    def show
        @post = Post.find(params[:id])
        render json: @post
    end

    def index
        @posts = Post.page(params[:page]).per(10)
        render json: @posts
    end

    def update 
        @post = Post.find(params[:id])
        @post.update(post_params)
    end

    def destroy 
        @post = Post.find(params[:id])
        @post.destroy
    end

    def search
        @search = Post.search(params[:q])
        @posts = @search.result
        render json: @posts
    end

    private

    def post_params
        params.require(:post).permit(:title, :body, :created_by)
    end
end
