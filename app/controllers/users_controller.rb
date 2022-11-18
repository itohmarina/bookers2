class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)
  end

  def edit
    @user=User.find(current_user.id)
  end

  def index
    @users=User.all
  end

  def update
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
    params.require(:user).permit(:name,:introduction)
  end




end
