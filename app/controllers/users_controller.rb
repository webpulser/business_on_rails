class UsersController < ApplicationController
  before_filter :get_user, :only => [:edit, :update]

  def show
    redirect_to :action => 'edit'
  end

  def update
  end

  def logins
    render :layout => false
  end

private
  def get_user
    if @user.nil?
      redirect_to login_path
    else
      @user = current_user
    end

  end

end
