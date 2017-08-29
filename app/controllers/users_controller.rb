class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def edit
    @user = current_user
  end

  def add_favourite
    @favourite = current_user.favourites.build(article_id: params[:article_id])
    if @favourite.save
      flash[:notice] = "Added a new favourite article."
      redirect_to root_url
    else
     flash[:error] = "Unable to add favourite article."
     redirect_to root_url
    end
  end

  # def get_favourites
  #
  # end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
