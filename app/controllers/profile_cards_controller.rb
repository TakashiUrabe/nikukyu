class ProfileCardsController < ApplicationController

  def new; end

  def create
    @profile_card = ProfileCard.new(profile_card_params)
    if @profile_card.save
      cookies[:id] = @profile_card.id
      @result = @profile_card.image_recognition(@profile_card.pad_image.url)
      redirect_to new_profile_card_path, success: '診断結果です'
    else
      flash.now[:danger] = '画像ファイルが受け付けられませんでした'
      render :new, status: :unprocessable_entity
    end
  end

  private

  def profile_card_params
    params.require(:profile_card).permit(:kind, :pad_image, :pad_image_cache)
  end

end
