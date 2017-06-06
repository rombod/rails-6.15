class UserMailer < ApplicationMailer
	default from: "melhoir@gmail.com"

  def contact_form(email, name, message)
  @message = message
  @name = name
  @email = email
    mail(:from => email,
        :to => 'your-email@example.com',
        :subject => "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
