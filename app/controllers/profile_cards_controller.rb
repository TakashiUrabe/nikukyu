class ProfileCardsController < ApplicationController

  def create
    @profile_card = ProfileCard.new(profile_card_params)
    if @profile_card.save
      cookies[:id] = @profile_card.id
      @profile_card.personality = @profile_card.image_recognition(@profile_card.pad_image.url)
      @profile_card.save
      redirect_to @profile_card, success: '診断結果です'
    else
      flash.now[:danger] = '画像ファイルが受け付けられませんでした'
      render template: "welcome_pages/top", status: :unprocessable_entity
    end
  end

  def show
    @user = User.new
    @profile_card = ProfileCard.find(params[:id])
  end

  def update
    if @profile.update(profile_card_params)
      redirect_to @profile_card
    else
      flash.now[:danger] = '入力項目が受け付けられませんでした'
      render :show, status: :unprocessable_entity
    end
  end
    def update
    if @board.update(board_params)
      redirect_to @board, success: t('defaults.message.updated',item:Board.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated',item:Board.model_name.human)
      render :edit
    end
  end

  private

  def profile_card_params
    params.require(:profile_card).permit(:name, :kind, :pad_image, :pad_image_cache)
  end
end
