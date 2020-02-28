class PostsController < ApplicationController
  before_action :locate_post, only: [:show, :edit, :update, :destroy, :like_post, :dislike_post]
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.likes = 0

    if @post.valid?
      @post.save
      flash[:notice] = 'New post created.'
      redirect_to post_path(@post)
    else
      @erros = @post.errors.full_messages

      flash[:errors] = @post.errors.full_messages
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  def like_post
    @post.up_like
    redirect_to post_path(@post)
  end 

  def dislike_post
    @post.down_like
    redirect_to post_path(@post)
  end 

  private
    def post_params
      params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end 

    def locate_post
      @post = Post.find(params[:id])
    end 
end
