class BooksController < ApplicationController
  def show
    @user=User.find(params[:id])
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def index
    @user=User.find(params[:id])
    @users=User.all
  end
end
