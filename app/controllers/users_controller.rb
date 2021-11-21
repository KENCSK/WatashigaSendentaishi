class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_page
    @posts = current_user.posts.page(params[:page])
    @user = current_user
  end

  def charms
    @posts = current_user.charmed_posts.page(params[:page])
    @user = current_user
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.find(params[:id])
  end

  def edit
    @user = current_user
    if @user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to my_page_path, notice: "ユーザー情報を更新しました！！"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :biography, :profile_image)
  end

end
