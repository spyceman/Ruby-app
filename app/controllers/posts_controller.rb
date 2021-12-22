class PostsController < ApplicationController
    authorize_resource
    before_action :authorized, except: [:show, :index, :search]
    before_action :find_post, except: [:create, :index, :search]

    def create 
        @post = Post.create(post_params)
    end

    def show
        render json: @post
    end

    def index
        @posts = Post.page(params[:page]).per(10)
        render json: @posts
    end

    def update 
        @post.update(post_params)
    end

    def destroy 
        @post.destroy
    end

    # def search
    #     @search = Post.search(params[:q])
    #     @posts = @search.result
    #     render json: @posts
    # end

    private

    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
