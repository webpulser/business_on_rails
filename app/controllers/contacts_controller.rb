class ContactsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    redirect_to new_contact_url
  end

  def new
    @contact = Contact.new
  end

  def create
    mail_params = params[:contact]
    respond_to do |format|
      begin
        email = Notifier.deliver_sent(mail_params)
        email = Notifier.deliver_confirm(mail_params)
      rescue Exception => e
        flash[:error] = "Problème durant l'envoie du message"
        logger.error "Erreur envoi message : #{e.message}"
        format.html { render :action => "new" }
      end
        format.html { redirect_to thanks_contacts_path }
    end
  end

  def thanks
  end
end
