class PasswordResetController < ApplicationController

  def reset
    if request.method.upcase == "GET"

    elsif request.method.upcase == "POST"
      @user = User.find_by(email: params[:email])

      if @user.present?
        # send email
        PasswordMailer.with(user: @user).reset.deliver_later # deliver_now also though it is synchronous.
      end
      redirect_to root_path, notice: "If an account with that email was found, we have sent a link to reset your password."
    else
      redirect_to root_path
    end
  end

  def edit
    begin
      @user  = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your token in invalid/expired. Please try again."
    end
  end

  def update
    begin
      @user = User.find_signed!(params[:token], purpose: "password_reset")
      if @user.update(password_params)
        redirect_to sign_in_path, notice: "Your password was reset successfully. Please sign in."
      else
        render :edit
      end
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Your token in invalid/expired. Please try again."
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
