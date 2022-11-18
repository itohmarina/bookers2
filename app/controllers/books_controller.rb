class BooksController < ApplicationController
  def show
    @user=User.find(current_user.id)
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def index
    @user=User.find(current_user.id)
    @books=Book.all
  end

  def create
    @book=Book.new(book_params)
    @book.users_id=current_user.id
    if @book.save
      flash[:notice]="Book was successfully created"#フラッシュメッセージ
      redirect_to "/books/#{@book.id}"
    else
      @books=Book.all
      render :index
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated"
      redirect_to "/books/#{@book.id}"
    else
      render :edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was successfully destroyed"
      redirect_to'/books'
    else
      render :index
    end
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end


end

