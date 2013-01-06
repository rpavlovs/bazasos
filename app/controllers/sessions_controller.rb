class SessionsController < ApplicationController
  skip_before_filter :ensure_user, only: [:new, :create]

  def new
    redirect_to :root if current_user
  end

  def create
    @credentials = OpenStruct.new(params[:credentials])
    user = User.authenticate(@credentials)
    if user
      session[:user_id] = user.id
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to action: :new
  end
end
