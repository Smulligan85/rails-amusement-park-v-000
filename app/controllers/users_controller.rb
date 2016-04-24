class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def signin
    @user = User.new
  end

  def logged_in
    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def signout
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                :height,
                                :happiness,
                                :nausea,
                                :tickets,
                                :admin)
  end
end
