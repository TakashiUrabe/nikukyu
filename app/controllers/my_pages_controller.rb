class MyPagesController < ApplicationController
  before_action :require_login
  before_action :set_user
  def show
    @profile_cards = current_user.profile_cards.order(updated_at: :desc)
    @profile_cards = @profile_cards.page(params[:page]).per(12)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
