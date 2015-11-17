class Admin::UsersController < ApplicationController

  before_filter :require_admin

  def require_admin
    unless current_user.admin?
      session[:flash] = "Sorry, not for you!"
      @flash = session[:flash]
      redirect_to '/'
    end
  end

  def index
    @users = User.order(:lastname).page(params[:page]).per(10)
  end


end
