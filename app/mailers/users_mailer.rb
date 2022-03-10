class UsersMailer < ApplicationMailer
  default from: 'prajesh.shakya12@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://127.0.0.1:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Leave Management System')
  end

  def leaverequest_email
    @leave = params[:leave]
    binding.pry
    @url = "http://127.0.0.1:3000/leaverecords/#{@leave.id}/edit"
    @admin = User.select(:email).find_by(name: @leave.approval_by)
    #binding.pry
    if @admin
      mail(to: @admin.email, subject: 'Leave Request')
    end
  end
end
