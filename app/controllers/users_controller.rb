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
    if current_user === nil
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    User.find(params[:id]).destroy

    flash[:success] = "User deleted"
    redirect_to '/login'
  end

  def add_favourite
    @favourite = current_user.favourites.build(article_id: params[:article_id])
    if @favourite.save
      flash[:notice] = "Added a new favourite article."
      redirect_to '/articles/'+ params[:article_id]
    else
     flash[:error] = "You have added this article to favourite"
     redirect_to '/articles/'+ params[:article_id]
    end
  end

  # def remove_favourite
  #   @favourite = Favourite.find(params[:article_id])
  #   # current_user.favourites.build(article_id: params[:article_id])
  #   if @favourite.destroy
  #     flash[:notice] = "Removed from favourites"
  #     redirect_to '/articles/'+ params[:article_id]
  #   else
  #    flash[:error] = "Unable to remove favourite article."
  #    redirect_to '/articles/'+ params[:article_id]
  #   end
  # end



  # def get_favourites
  #
  # end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
