class UserMailerWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.lend_book_request_sent_email(user).deliver
  end
end

