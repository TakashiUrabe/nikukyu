class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      if cookies.has_key?(:nikukyu_id)
        current_profile_card = ProfileCard.find(cookies[:nikukyu_id])
        current_profile_card.user_id_setting(@user.id)
        cookies.delete :nikukyu_id
        @profile_card = current_profile_card
        redirect_to edit_profile_card_path(@profile_card), success:'ユーザー登録できました'
      else
        redirect_to root_path, success:'ユーザー登録できました'
      end
    else
      flash.now[:alert] = 'ユーザー登録できませんでした'
      render new_user_path, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
