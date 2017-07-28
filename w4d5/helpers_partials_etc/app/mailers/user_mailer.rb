class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/new'

    mail(to: 'tester@gmail.com', subject: 'Rent at Your Leisure!')
  end

end
