class PostsController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_user

  def index
    @posts = Post.all
  end

  def mypost
    @myposts = Post.where(user_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :posts, notice: '投稿が追加されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to :posts, notice: "この操作を行うことができません。"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to mypost_posts_path, notice: '投稿内容を編集しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to :posts, notice: "この操作を行うことができません。"
    else
      @post.destroy
      redirect_to mypost_posts_path, notice: "投稿を削除しました。"
    end
  end

  def set_user
    @user = current_user
  end

  private

  def post_params
    params.require(:post).permit(:category, :body, :user_id)
  end
end
