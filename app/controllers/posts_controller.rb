class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = current_user.posts.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post was successfully created"
    else
      flash[:notice] = "NOOOOOOOOOOO"
      render 'new'
    end
  end

  def show
  end
  private
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
