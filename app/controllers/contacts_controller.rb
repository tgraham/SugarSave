class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      NotifierMailer.contact_email(@contact).deliver
      flash[:notice] = "Successfully sent."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
