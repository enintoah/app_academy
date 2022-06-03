class PostsController < ApplicationController
  before_action :require_logged_in, only: [:new, :edit]

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.where("id = #{@post.user_id}").pluck(:username)
    @sub = Sub.where("id = #{@post.sub_id}").pluck(:title)
    render :show
  end

  def create
    @post = Post.new(valid_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(valid_params)
      redirect_to post_url(params[:id])
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def new
    if params.has_key?(:sub_id)
      @sub_id = params[:sub_id]
      @post = Post.new
      render :new
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  private
  def valid_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :user_id)
  end
end
