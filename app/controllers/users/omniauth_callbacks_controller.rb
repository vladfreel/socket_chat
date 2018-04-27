class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    p request.env["omniauth.auth"]
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session['devise.user_attributes'] = @user.attributes
      sign_in_and_redirect @user
    end
  end
  def twitter
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      sign_in_and_redirect user
    end
  end
  def instagram
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      sign_in_and_redirect user
    end
  end
  def google_oauth2
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      sign_in_and_redirect user
    end
  end
  def github
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      sign_in_and_redirect user
    end
  end

  def failure
    redirect_to root_path
  end
end