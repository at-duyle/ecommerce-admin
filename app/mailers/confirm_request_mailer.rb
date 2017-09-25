class ConfirmRequestMailer < ApplicationMailer
  def confirm_request(admin)
    @admin = admin
    @url = 'http://127.0.0.1:3000'
    mail(to: @admin.email, subject: 'Welcome to Super Shop')
  end

  def refuse_request(request)
    @request = request
    mail(to: @request.email, subject: 'Welcome to Super Shop')
    @request.destroy
  end
end
