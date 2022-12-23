class TweetsController < ApplicationController
  before_action :set_profile_card

  def tweet
    render 'tweet_a' if params[:card_type] == 'a'
    render 'tweet_b' if params[:card_type] == 'b'
    render 'tweet_c' if params[:card_type] == 'c'
    render 'tweet_d' if params[:card_type] == 'd'
    render 'tweet_e' if params[:card_type] == 'e'
    render 'tweet_f' if params[:card_type] == 'f'
  end
end
