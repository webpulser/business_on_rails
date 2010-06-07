class UsersController < ApplicationController
  before_filter :get_user, :only => [:edit, :update]

  def show
    redirect_to :action => 'edit'
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = t('user.update.success')
      return redirect_to(retail_user_path)
    else
      flash[:error] = t('user.update.failed')
      render :action => 'edit'
    end
  end

  def logins
    render :layout => false
  end

private
  def get_user
    if current_user.nil?
      redirect_to login_path
    else
      @user = current_user
    end

  end

end
