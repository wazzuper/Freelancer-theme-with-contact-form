class HomeController < ApplicationController
  def welcome
    @contact = Contact.new
  end
end
