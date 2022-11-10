class WelcomePagesController < ApplicationController
  def top
    @profile_card = ProfileCard.new
    @profile_cards = ProfileCard.where.not(card_type: nil).order(updated_at: :desc)
    @profile_cards = @profile_cards.page(params[:page]).per(5)
  end
end
