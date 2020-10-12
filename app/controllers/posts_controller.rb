class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = find_post_by_id
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content])
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
    @post.content = params[:content]
    if @post.save
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
  
  
  private
  
    def find_post_by_id
      Post.find(params[:id])
    end
  
end
