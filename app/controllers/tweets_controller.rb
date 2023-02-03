class TweetsController < ApplicationController
  before_action :set_profile_card

  def tweet
    card_type = { 'tweet_a': 'a', 'tweet_b': 'b', 'tweet_c': 'c', 'tweet_d': 'd', 'tweet_e': 'e', 'tweet_f': 'f', 'tweet_g': 'g', 'tweet_h': 'h', 'tweet_i': 'i', 'tweet_j': 'j', 'tweet_k': 'k', 'tweet_l': 'l', 'tweet_m': 'm', 'tweet_n': 'n', 'tweet_o': 'o', 'tweet_p': 'p', 'tweet_q': 'q', 'tweet_r': 'r' }

    card_type.each  do |key, value|
      render key if params[:card_type] == value
    end
  end
end
