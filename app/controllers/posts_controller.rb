class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_comments, only: :show

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to(@post)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to(@post)
    else
      render edit
    end
  end

  def show
  end

  def index
    @posts = policy_scope(Post).paginate(page: params[:page], per_page: 3)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :preface, :body, :thumbnail, :thumbnail_cache)
  end

  def set_post
    @post = Post.friendly.find(params[:id])
    authorize @post
  end

  def set_comments
    @comments = @post.comments
  end
end
