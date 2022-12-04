class TweetsController < ApplicationController
  before_action :set_profile_card, only: %i[tweet_a tweet_b tweet_c tweet_d]

  def tweet_a; end

  def tweet_b; end

  def tweet_c; end

  def tweet_d; end
end
