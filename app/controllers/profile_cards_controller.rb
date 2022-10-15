class ProfileCardsController < ApplicationController

  def create
    @profile_card = ProfileCard.new(profile_card_params)
    @profile_card.personality = @profile_card.image_recognition(@profile_card.pad_image.url)
    if @profile_card.save
      cookies[:id] = @profile_card.id
      binding.break
      redirect_to @profile_card, success: '診断結果です'
    else
      flash.now[:danger] = '画像ファイルが受け付けられませんでした'
      render :root, status: :unprocessable_entity
    end
  end

  def show
    @profile_card = ProfileCard.find(params[:id])
  end

  private

  def profile_card_params
    params.require(:profile_card).permit(:kind, :pad_image, :pad_image_cache)
  end
end
