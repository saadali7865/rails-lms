class UserMailer < ApplicationMailer
  def lend_book_request_sent_email(user)
    @user = user
    mail(to: @user.email, subject: 'Book Request Submitted.')
  end
end
