class StudentMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    require "pry"
    binding.pry
    mail(to: @user.email, subject: "Your Account on Turing Partnerships")
  end
end
