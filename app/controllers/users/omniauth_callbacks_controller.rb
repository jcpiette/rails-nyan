# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def facebook
  #   user = User.create_from_provider_data(auth)

  #   if @user.present?
  #     sign_out_all_scopes
  #     flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Facebook'
  #     sign_in_and_redirect user, event: :authentication
  #   else
  #     flash[:alert] = t 'devise.omniauth_callbacks.failure', reason: "#{auth.info.email} is not authorized"
  #     redirect_to new_user_registration_url
  #   end
  # end

  def google_oauth2
    user = User.create_from_provider_data(auth)

    if @user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you in throught Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end

  def passthru
    render status: 404, plain: "Not found. Authentication passthru."
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
