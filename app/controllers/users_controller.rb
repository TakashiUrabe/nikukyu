class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      current_profile_card = ProfileCard.find(cookies[:id])
      current_profile_card.user_id_setting(@user.id)
      cookies.delete :id
      @profile_card = current_profile_card
      redirect_to @profile_card
      flash[:notice] = 'ユーザーの作成に成功しました'
    else
      flash.now[:alert] = 'ユーザーの作成に失敗しました'
      render @profile_card
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
