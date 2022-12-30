class TweetsController < ApplicationController
  before_action :set_profile_card

  def tweet
    card_type = { 'tweet_a': 'a', 'tweet_b': 'b', 'tweet_c': 'c', 'tweet_d': 'd', 'tweet_e': 'e', 'tweet_f': 'f' }

    card_type.each  do |key, value|
      render key if params[:card_type] == value
    end
  end
end
