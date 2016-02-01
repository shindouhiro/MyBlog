class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy, :edit]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
   @post = Post.new post_params
    if @post.save
      redirect_to @post, notice: "文章创建成功!"
    else
      render 'new', notice: "文章创建失败!"
    end
  end
  
  def edit
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "文章删除成功!"
    end
  end

  def update
     if @post.update post_params
        redirect_to @post, notice: "文章更改成功!" 
     else
        render 'edit', notice: "文章修改失败!"
     end
  end


  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
