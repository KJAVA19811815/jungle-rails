class Notifier < ApplicationMailer
  default from: 'no-reply@example.com',
          return_path: 'system@example.com'


  def order_email(user, order)
    @order = order
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end

end
