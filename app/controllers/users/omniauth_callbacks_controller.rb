clasudo service postgresql startsudo service postgresql startFACEBOOK_ID_DEVELOPMENT=1954426281492531
FACEBOOK_SECRET_DEVELOPMENT=6f3de7b8d06494d0390b86cf7c063fd7
TWITTER_ID_DEVELOPMENT=74cDI7qY90VRHr6LpJD5Ke1R9
TWITTER_SECRET_DEVELOPMENT=BhLnsjKMHuZJWQhIN6RW4CYzT3jHQxzSSbh2MkrECuYcCLet1Ysudo service postgresql startFACEBOOK_ID_DEVELOPMENT=1954426281492531
FACEBOOK_SECRET_DEVELOPMENT=6f3de7b8d06494d0390b86cf7c063fd7
TWITTER_ID_DEVELOPMENT=74cDI7qY90VRHr6LpJD5Ke1R9
TWITTER_SECRET_DEVELOPMENT=BhLnsjKMHuZJWQhIN6RW4CYzT3jHQxzSSbh2MkrECuYcCLet1Yss Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
   def twitter
    # You need to implement the method below in your model
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end
end