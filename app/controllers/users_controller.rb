class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    is_matching_login_user
    @user=current_user

  end

  def index
    @user=current_user
    @users=User.all
  end

  def update
    is_matching_login_user

    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  #ストロングパラメータ
  def user_params
    params.require(:user).permit(:name,:introduction, :profile_image)
  end

  def is_matching_login_user
    user_id=params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
    redirect_to user_path(current_user.id)
    end
  end


end
