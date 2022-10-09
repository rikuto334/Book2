class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @books=@user.books
  end

  def index
    @users=User.all
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "User was successfully updated."
        redirect_to users_path
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
