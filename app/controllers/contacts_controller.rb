class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.create(contact_params)
    flash[:notice] = "Your message was sent "
    redirect_to root_path
  end
  private
  def contact_params
    params.require(:contact).permit(:full_name, :email, :phone, :message)
  end
end
