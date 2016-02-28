class StudentMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: 'adrienne.domingus@gmail.com', subject: "Your Account on Turing Partnerships")
  end
end
