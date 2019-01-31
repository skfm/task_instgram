class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    if params[:back]
      @user = User.new(picture_params)
    else
      @user = User.new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
      #pictures_path
    else
      render 'new'
    end
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'プロフィールを編集しました！' 
    else
      render 'edit'
    end
  end
  
  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
    
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end