class WelcomePagesController < ApplicationController
  def top
    @profile_card = ProfileCard.new
    @profile_cards = ProfileCard.where.not(card_type: nil).order(updated_at: :desc)
  end
end
