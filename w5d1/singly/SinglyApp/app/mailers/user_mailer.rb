class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/users/new"

    mail(to: user.email, subject: "Welcome to Singly, groove your way")
  end

end
