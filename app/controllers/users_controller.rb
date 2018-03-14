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
    @friends = @user.all_friends
    # Should Paginate
    @users = User.all
  end

  def tag_search
    #  need this for form.
    # Probably wouldn't use same display, probably use Javascript instead of just refreshing
    @new_user = User.new
    @users = User.all
    if params[:friend_scoped ] && params[:q]
      # Gross
      @user = User.find_by(id: params[:user_id])
      @friends = @user.all_friends
      matched_users = User.tagged_with(params[:q], wild: true, any: true)
      @matched_users = matched_users - @friends
      # change this to a different template
      render :show
    elsif params[:q]
      @matched_users = User.tagged_with(params[:q], wild: true, any: true)
      render :index
    end
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :website_full_url)
  end

end
