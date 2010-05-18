class Notifier < ActionMailer::Base

  def sent(mail_params)
    subject    'Notifier#sent'
    recipients Setting.all[0].email
    from       "#{mail_params[:email]}"
    sent_on    Time.now

    @mail_params = mail_params
  end

  def confirm(mail_params)
    subject    'Notifier#confirm'
    recipients "#{mail_params[:email]}"
    from       Setting.all[0].email
    sent_on    Time.now

    @mail_params = mail_params
  end

end
