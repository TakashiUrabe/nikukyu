class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      if cookies.has_key?(nikukyu_id)
        current_profile_card = ProfileCard.find(cookies[nikukyu_id])
        current_profile_card.user_id_setting(@user.id)
        cookies.delete nikukyu_id
        @profile_card = current_profile_card
        redirect_to @profile_card, success:'ユーザーの作成に成功しました'
      else
        redirect_to root_path, success:'ユーザーの作成に成功しました'
      end
    else
      flash.now[:alert] = 'ユーザーの作成に失敗しました'
      render new_user_path, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
