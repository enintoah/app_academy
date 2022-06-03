class SubsController < ApplicationController
  before_action :require_logged_in, only: [:new, :edit]
  before_action :check_owner, only: :edit

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    @posts = Post.select("*").where("sub_id = #{@sub.id}")
    render :show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(valid_params)
    if @sub.save!
        redirect_to subs_url
    else
        flash.now[:errors] = @sub.errors.full_messages
        render :new
    end
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update(valid_params)
      redirect_to sub_url(params[:id])
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def check_owner
    @sub = Sub.find_by(id: params[:id]) 
    if @sub.moderator_id != current_user.id
      redirect_to sub_url(@sub)
    end
  end
  
  private
  def valid_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
