class PostsController < ApplicationController
  before_action :authenticate_user!
  

  def index
    puts "here are paras"
    puts params
    puts "done"
    if params[:title] == nil
      @posts = Post.all
    else
      @posts = Post.search_by_title(params[:title])
    end
  end
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
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end
  private
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
