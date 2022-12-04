class ProfileCardsController < ApplicationController
  before_action :set_profile_card, only: %i[result edit update]

  def new
    @profile_card = ProfileCard.new
  end

  def index
    @profile_cards = ProfileCard.where.not(card_type: nil).order(updated_at: :desc)
    @profile_cards = @profile_cards.page(params[:page]).per(10)
  end

  def create
    @profile_card = if current_user.nil?
                      ProfileCard.new(profile_card_params)
                    else
                      current_user.profile_cards.new(profile_card_params)
                    end
    if @profile_card.save
      cookies[:kind] = params[:profile_card][:kind]
      cookies[:nikukyu_id] = @profile_card.id if current_user.nil?
      @profile_card.image_recognition(@profile_card.pad_image.url, cookies[:kind])
      redirect_to action: :result, id: @profile_card.id
    else
      flash.now[:danger] = t('defaults.message.not_tested')
      render new_profile_card_path, status: :unprocessable_entity
    end
  end

  def result
    @ogp_img = "ogp_result_#{@profile_card.personality}.png"
  end

  def edit
    @user = User.new
    unless @profile_card.user_id == current_user&.id || @profile_card.id == cookies[:nikukyu_id]
      flash[:notice] = t('defaults.message.not_authorized')
      redirect_to root_path
    end
  end

  def update
    if @profile_card.update(profile_card_params) && @profile_card.face_image.url != 'face_image_sample.png'
      cookies.delete :kind
      @profile_card.create_profile_card
      redirect_to edit_profile_card_path(@profile_card), success: t('defaults.message.updated')
    else
      flash.now[:danger] = t('defaults.message.not_updated')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_card_params
    params.require(:profile_card).permit(:breed_id, :name, :gender, :birthday, :face_image, :face_image_cache, :pad_image, :pad_image_cache, :favorite_treat, :favorite_toy)
  end
end
