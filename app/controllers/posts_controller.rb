class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.valid?
      @post.save
      flash.now[:success] = "Post has been created"
      redirect_to root_path, status: :see_other
    else
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
