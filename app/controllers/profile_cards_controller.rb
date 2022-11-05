class ProfileCardsController < ApplicationController

  def create
    @profile_card = ProfileCard.new(profile_card_params)
    cookies[:kind] = params[:profile_card][:kind]
    if @profile_card.save
      cookies[:id] = @profile_card.id
      @profile_card.personality = @profile_card.image_recognition(@profile_card.pad_image.url,cookies[:kind])
      @profile_card.save
      redirect_to @profile_card
    else
      flash.now[:danger] = '画像ファイルが受け付けられませんでした'
      render template: "welcome_pages/top", status: :unprocessable_entity
    end
  end

  def show
    @user = User.new
    @profile_card = ProfileCard.find(params[:id])
    @profile_card.remove_background(@profile_card.pad_image, 'app/assets/images/rembg_pad_image.png')
    @profile_card.rembg_pad_image = File.open("./app/assets/images/rembg_pad_image.png","r")
    @profile_card.binarize_otsu("./app/assets/images/rembg_pad_image.png")
    @profile_card.binarize_image = File.open("./app/assets/images/bin_img.png","r")
    @profile_card.save
  end

  def update
    @profile_card = ProfileCard.find(params[:id])
    if @profile_card.update(profile_card_params)
      cookies.delete :kind
      @profile_card.remove_background(@profile_card.face_image, 'app/assets/images/rembg_face_image.png')
      @profile_card.create_profile_card_a(@profile_card)
      @profile_card.profile_card_data_a = File.open("./app/assets/images/profile_card_data_a.jpg","r")
      @profile_card.create_profile_card_b(@profile_card)
      @profile_card.profile_card_data_b = File.open("./app/assets/images/profile_card_data_b.jpg","r")
      @profile_card.save
      redirect_to @profile_card
    else
      flash.now[:danger] = '入力項目が受け付けられませんでした'
      render :show, status: :unprocessable_entity
    end
  end

  def download
    profile_card = ProfileCard.find(download_params[:id])
    image = profile_card.profile_card_data_a
    send_data(image.read, filename: "#{profile_card.name}ちゃんのプロフィールカード")
  end

  private

  def profile_card_params
    params.require(:profile_card).permit(:breed_id, :name, :gender, :birthday, :face_image, :face_image_cache, :pad_image, :pad_image_cache, :favorite_treat, :favorite_toy, )
  end

  def download_params
    params.permit(:id)
  end
end
