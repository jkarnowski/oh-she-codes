class PostsController < ApplicationController
	
	before_action :find_post, only: [:show, :edit, :update, :destroy]

	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice: "Post created!"
		else
			render 'new', notice: "Oh NO! Something went wrong and the post was not saved."
		end
	end

	def show
	end

	private
	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
