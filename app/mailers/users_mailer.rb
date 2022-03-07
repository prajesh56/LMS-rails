class UsersMailer < ApplicationMailer
  default from: 'prajesh.shakya12@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://127.0.0.1:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Leave Management System')
  end
end
