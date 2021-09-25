class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about, :public_action]
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if
      @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    #@userに関連付けされたやつを@booksに渡している
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@books)
    else
      @books = Book.all
      render 'index'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You hava update user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
