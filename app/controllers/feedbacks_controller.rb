class FeedbacksController < ApplicationController
  def new
  end

  def create
    user_email = params[:user_email]
    message = params[:message]

    if email.present? && message.present?
      FeedbackMailer.send_feedback(user_email, message).deliver_now
      flash[:notice] = "Thank you for your feedback!"
      redirect_to root_path
    else
      flash[:alert] = t(".error")
      render :new
    end
  end
end
