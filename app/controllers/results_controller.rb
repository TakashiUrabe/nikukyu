class ResultsController < ApplicationController
  before_action :set_profile_card, only: %i[result]

  def result
    @ogp_img = "ogp_result_#{@profile_card.personality}.png"
  end
end
