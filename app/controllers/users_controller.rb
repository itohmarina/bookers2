class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)
  end

  def edit
    user_id=params[:id].to_i
    login_user_id=current_user.id
    if(user_id != login_user_id)
      redirect_to user_path
    end
    @user=User.find(current_user.id)
  end

  def index
    @user=current_user
    @users=User.all
  end

  def update
    user_id=params[:id].to_i
    login_user_id=current_user.id
    if(user_id != login_user_id)
      redirect_to user_path
    end

    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="Book was successfully updated"
      redirect_to "/users/#{@user.id}"
    else
      render :edit
    end
  end

  private
  #ストロングパラメータ
  def user_params
    params.require(:user).permit(:name,:introduction, :profile_image)
  end




end
