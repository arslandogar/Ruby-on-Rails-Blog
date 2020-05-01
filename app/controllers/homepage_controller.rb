class HomepageController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all.order(created_at: :desc).limit(5) 
  end
end
