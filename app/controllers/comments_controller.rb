class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:create, :show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    @comment = @post.comments.new(comment_params)
    authorize @comment

    if @comment.save!
      redirect_to(@post)
    else
      render new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_comment_path(@post,@comment)
    else
      render edit
    end
  end

  def show
  end

  def index
    @comments = policy_scope(Comment)
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :name, :email)
  end

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end
end
