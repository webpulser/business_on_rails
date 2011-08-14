class Notifier < ActionMailer::Base

  def sent(mail_params)

    @mail_params = mail_params
    mail(
      :to => Setting.current.email,
      :from => mail_params[:email],
      :subject => "Botifier#sent"
    )
  end

  def confirm(mail_params)
    @mail_params = mail_params
    mail(
      :to => Setting.current.email,
      :from => mail_params[:email],
      :subject => "Botifier#sent"
    )
  end

end
