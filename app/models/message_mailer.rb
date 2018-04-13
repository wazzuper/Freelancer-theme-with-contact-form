class MessageMailer < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  attribute :message

  def headers
    {
      subject: "Hey! Thank you for contacting me.",
      to: "#{email}",
      from: "#{ENV['GMAIL_USERNAME']}"
    }
  end
end
