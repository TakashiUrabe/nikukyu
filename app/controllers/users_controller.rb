class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      find_profile_card_and_set_id
    else
      flash.now[:alert] = t('.fail')
      render new_user_path, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_profile_card_and_set_id
    if cookies.key?(:nikukyu_id)
      @profile_card = ProfileCard.find(cookies[:nikukyu_id])
      @profile_card.user_id_setting(@user.id)
      cookies.delete :nikukyu_id
      redirect_to edit_profile_card_path(@profile_card), success: t('.success')
    else
      redirect_to root_path, success: t('.success')
    end
  end
end
