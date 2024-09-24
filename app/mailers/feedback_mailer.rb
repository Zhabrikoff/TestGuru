class FeedbackMailer < ActionMailer::Base
  default to: -> { admin = Admin.first.email }

  def send_feedback(user_email, message)
    @user_email = user_email
    @message = message

    mail(from: @user_email, subject: "New Feedback")
  end
end
