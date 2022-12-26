class OauthsController < ApplicationController
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]

    if auth_params[:denied].present?
      redirect_to root_path, success: t('.success_register')
      return
    end

    begin
      create_user_from(provider) unless (@user = login_from(provider))
      find_profile_card_and_set_id
      flash[:success] = t('.success_login')
    rescue StandardError
      redirect_to root_path, danger: t('.fail_login')
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :denied)
  end

  def create_user_from(provider)
    @user = create_from(provider)
    reset_session
    auto_login(@user)
  end
end
