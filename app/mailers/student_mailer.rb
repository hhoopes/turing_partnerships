class StudentMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: ENV["EMAIL_ADDRESS"], subject: "Your Account on Turing Partnerships")
  end
end
