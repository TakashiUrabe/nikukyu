class DownloadsController < ApplicationController
  before_action :set_profile_card

  def download
    card_type = { 'A': '1', 'B': '2', 'C': '3', 'D': '4', 'E': '5', 'F': '6', 'G': '7', 'H': '8', 'I': '9', 'J': '10', 'K': '11', 'L': '12', 'M': '13', 'N': '14', 'O': '15', 'P': '16', 'Q': '17', 'R': '18' }
    card_type.each do |key, value|
      @profile_card.card_type = key if params[:card_type] == value
    end
    send_image
  end

  private

  def send_image
    image = @profile_card.send("profile_card_data_#{@profile_card.card_type.downcase}")
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
  end
end
