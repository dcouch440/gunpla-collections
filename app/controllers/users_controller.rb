class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User successfully created'
      redirect_to users_path
    else
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User successfully updated'
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:alert] = 'User has been successfully deleted'
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end