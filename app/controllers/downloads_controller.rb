class DownloadsController < ApplicationController
  before_action :set_download_card, only: %i[download_a download_b download_c download_d]

  def download_a
    image = @profile_card.profile_card_data_a
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'A'
    @profile_card.save
  end

  def download_b
    image = @profile_card.profile_card_data_b
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'B'
    @profile_card.save
  end

  def download_c
    image = @profile_card.profile_card_data_c
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'C'
    @profile_card.save
  end

  def download_d
    image = @profile_card.profile_card_data_d
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'D'
    @profile_card.save
  end

  private

  def download_params
    params.permit(:id)
  end

  def set_download_card
    @profile_card = ProfileCard.find(download_params[:id])
  end
end
