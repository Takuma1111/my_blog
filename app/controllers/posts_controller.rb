class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
    @new_posts = Post.all
    @author = Author.first
  end

  def show
    # @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to @post   #post_path(@post)でもOK
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :category)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
