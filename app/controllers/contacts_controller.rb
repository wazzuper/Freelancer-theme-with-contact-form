class ContactsController < ApplicationController
  def create
    contact = Contact.new(contact_params)
    message = MessageMailer.new(contact_params)

    if contact.save
      message.deliver
      redirect_to root_path
    else
      redirect_back(fallback_location: request.referer)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
