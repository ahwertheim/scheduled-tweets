class PasswordResetsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "Please check your email inbox"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to password_reset_path, alert: "Your token has expired. Please try recovering your password again."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to signin_path, notice: "Password successfully updated. Please now login"
    else
      render :edit
    end
  end

private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
