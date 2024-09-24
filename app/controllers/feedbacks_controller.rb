class FeedbacksController < ApplicationController
  def new
  end

  def create
    user_email = params[:user_email]
    message = params[:message]

    FeedbackMailer.send_feedback(user_email, message).deliver_now
    flash[:notice] = "Thank you for your feedback!"
    redirect_to root_path
  end
end
