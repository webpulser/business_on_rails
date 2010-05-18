class PersonSessionsController < ApplicationController

  def create
    @person_session = PersonSession.new(params[:person_session])
    if @person_session.save
      if session[:login_redirect]
        redirect_to(session[:login_redirect])
      else
        user = Person.find_by_email(@person_session.email)
        if user.is_a? Administrator
          redirect_to('/admin')
        else
          redirect_to('/')
        end
      end
    else
      flash[:error] = t('log.in.failed').capitalize
      redirect_to login_path
    end
  end
end
