class MyPagesController < ApplicationController
  before_action :set_user
  def show
    @profile_cards = current_user.profile_cards.where.not(card_type: nil).order(updated_at: :desc)
    @profile_cards = @profile_cards.page(params[:page]).per(10)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end