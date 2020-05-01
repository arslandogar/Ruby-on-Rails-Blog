class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
    if params[:title] == nil
      @posts = Post.all.paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.search_by_title(params[:title]).paginate(page: params[:page], per_page: 5)
    end
  end

  def new
    @post = current_user.posts.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      flash[:notice] = "NOOOOOOOOOOO"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    render 'show'
  end


  private
  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
