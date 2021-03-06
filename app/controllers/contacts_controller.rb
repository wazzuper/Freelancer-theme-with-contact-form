class ContactsController < ApplicationController
  def create
    contact = Contact.new(contact_params)
    message = MessageMailer.new(contact_params)

    if contact.save
      message.deliver
      redirect_to root_path
      flash[:notice] = 'Message sent! Thank you.'
    else
      redirect_back(fallback_location: request.referer)
      flash[:alert] = contact.errors.full_messages.join(', ')
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
