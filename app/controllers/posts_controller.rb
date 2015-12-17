class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at desc')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success]='Upload successfuly'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success]='Photos successfully deleted'
    reditect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
