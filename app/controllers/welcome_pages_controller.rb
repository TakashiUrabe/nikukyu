class WelcomePagesController < ApplicationController
  def top
    @profile_card = ProfileCard.new
  end
end
