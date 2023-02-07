class ProfileCardsController < ApplicationController
  before_action :set_profile_card, only: %i[edit update]

  def new
    @profile_card = ProfileCard.new
  end

  def index
    @profile_cards = ProfileCard.where(card_type: ..."M").order(updated_at: :desc)
    @profile_cards = @profile_cards.page(params[:page]).per(10)
  end

  def create
    @profile_card = if current_user.nil?
                      ProfileCard.new(profile_card_params)
                    else
                      current_user.profile_cards.new(profile_card_params)
                    end
    if @profile_card.save
      set_cookies
      @profile_card.image_recognition(@profile_card.pad_image.url, cookies[:kind])
      redirect_to controller: :results, action: :result, id: @profile_card.id
    else
      flash.now[:danger] = t('defaults.message.not_tested')
      render new_profile_card_path, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.new
    return if own_card?

    flash[:notice] = t('defaults.message.not_authorized')
    redirect_to root_path
  end

  def update
    if @profile_card.update(profile_card_params) && @profile_card.face_image.url != 'face_image_sample.png'
      cookies.delete :kind
      @profile_card.remove_background(@profile_card.face_image.url) if params[:profile_card][:face_image].present?
      @profile_card.create_profile_card(params[:profile_card][:card_type])
      redirect_to edit_profile_card_path(@profile_card, anchor: 'target'), success: t('defaults.message.updated'), allow_other_host: true
    else
      flash.now[:danger] = t('defaults.message.not_updated')
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_card_params
    params.require(:profile_card).permit(:breed_id, :name, :gender, :birthday, :face_image, :face_image_cache, :pad_image, :pad_image_cache, :favorite_treat, :favorite_toy, :card_type)
  end

  def set_cookies
    cookies[:kind] = params[:profile_card][:kind]
    cookies[:nikukyu_id] = @profile_card.id if current_user.nil?
  end

  def own_card?
    @profile_card.user_id == current_user&.id || @profile_card.id == cookies[:nikukyu_id]
  end
end
