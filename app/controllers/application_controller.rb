class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def set_profile_card
    @profile_card = ProfileCard.find(params[:id])
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
