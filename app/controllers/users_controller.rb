class UsersController < ApplicationController
  def index
    # should paginate
    @new_user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_back(fallback_location: users_path)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :website_full_url)
  end

end
