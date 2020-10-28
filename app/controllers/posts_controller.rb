class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  before_action :authenticate_user
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = find_post_by_id
    # @user = User.find_by(id: @post.user_id)
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content])
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to(posts_path)
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = find_post_by_id
  end
  
  def update
    @post = find_post_by_id
    if @post.update(content: params[:content])
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = find_post_by_id
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to posts_path
    end
  end
  
  
  private
    def find_post_by_id
      Post.find(params[:id])
    end
    
    def post_params
      params.require(:posts).permit(:content)
    end
  
end
