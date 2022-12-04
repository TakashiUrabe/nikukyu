class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def set_profile_card
    @profile_card = ProfileCard.find(params[:id])
  end
end
