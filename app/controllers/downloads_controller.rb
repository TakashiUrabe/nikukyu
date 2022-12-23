class DownloadsController < ApplicationController
  before_action :set_profile_card

  def download
    set_card_type
    send_image
  end

  private

  def send_image
    image = @profile_card.send("profile_card_data_#{@profile_card.card_type.downcase}")
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
  end

  def set_card_type
    @profile_card.card_type = 'A' if params[:card_type] == '1'
    @profile_card.card_type = 'B' if params[:card_type] == '2'
    @profile_card.card_type = 'C' if params[:card_type] == '3'
    @profile_card.card_type = 'D' if params[:card_type] == '4'
    @profile_card.card_type = 'E' if params[:card_type] == '5'
    @profile_card.card_type = 'F' if params[:card_type] == '6'
    @profile_card.save
  end
end
