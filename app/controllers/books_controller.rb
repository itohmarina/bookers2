class BooksController < ApplicationController
  def show
    @user=current_user
    @book=Book.find(params[:id])

  end

  def edit
    @book=Book.find(params[:id])
    is_matching_login_user

  end

  def index
    @user=current_user
    @books=Book.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @user=current_user
    if @book.save
      flash[:notice]="Book was successfully created"#フラッシュメッセージ
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      render :index
    end
  end

  def update
    @book=Book.find(params[:id])
    is_matching_login_user

    if @book.update(book_params)
      flash[:notice]="Book was successfully updated"
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    is_matching_login_user

   if @book.destroy
      flash[:notice]="Book was successfully destroyed"
      redirect_to books_path
    else
      render :index
    end
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end

  def is_matching_login_user
    user_id=@book.user_id.to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to user_path(current_user.id)
    end
  end


end

