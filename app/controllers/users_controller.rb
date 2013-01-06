class UsersController < ApplicationController
  before_filter :find_user, only: [:edit, :update, :delete]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :edit
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to action: :index
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to action: :index
    else
      render :edit
    end
  end

  def delete
    @user.destroy
    redirect_to :back
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
