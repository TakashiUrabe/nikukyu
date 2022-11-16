class ProfileCardsController < ApplicationController
  def new
    @profile_card = ProfileCard.new
  end

  def index
    @profile_cards = ProfileCard.where.not(card_type: nil).order(updated_at: :desc)
    @profile_cards = @profile_cards.page(params[:page]).per(10)
  end

  def create
    if current_user.nil?
      @profile_card = ProfileCard.new(profile_card_params)
    else
      @profile_card = current_user.profile_cards.build(profile_card_params)
    end
    cookies[:kind] = params[:profile_card][:kind]
    if @profile_card.save
      cookies[:id] = @profile_card.id
      @profile_card.personality = @profile_card.image_recognition(@profile_card.pad_image.url,cookies[:kind])
      @profile_card.save
      redirect_to action: :result, id: @profile_card.id
    else
      flash.now[:danger] = 'にくきゅう診断ができませんでした'
      render new_profile_card_path, status: :unprocessable_entity
    end
  end

  def result
    @profile_card = ProfileCard.find(params[:id])
  end

  def show
    @user = User.new
    @profile_card = ProfileCard.find(params[:id])
    # @profile_card.remove_background(@profile_card.pad_image, 'app/assets/images/sample/rembg_pad_image.png')
    # @profile_card.rembg_pad_image = File.open("./app/assets/images/sample/rembg_pad_image.png","r")
    @profile_card.binarize_otsu("./app/assets/images/sample/rembg_pad_image.png")
    @profile_card.binarize_image = File.open("./app/assets/images/sample/bin_img.png","r")
    @profile_card.save
  end

  def update
    @profile_card = ProfileCard.find(params[:id])
    if @profile_card.update(profile_card_params)
      cookies.delete :kind
      @profile_card.remove_background(@profile_card.face_image, 'app/assets/images/sample/rembg_face_image.png')
      @profile_card.rembg_face_image = File.open("./app/assets/images/sample/rembg_face_image.png","r")
      @profile_card.create_profile_card_a(@profile_card)
      @profile_card.profile_card_data_a = File.open("./app/assets/images/sample/profile_card_data_a.jpg","r")
      @profile_card.create_profile_card_b(@profile_card)
      @profile_card.profile_card_data_b = File.open("./app/assets/images/sample/profile_card_data_b.jpg","r")
      @profile_card.save
      redirect_to @profile_card
    else
      flash.now[:danger] = '入力項目が受け付けられませんでした'
      render :show, status: :unprocessable_entity
    end
  end

  def download_a
    @profile_card = ProfileCard.find(download_params[:id])
    image = @profile_card.profile_card_data_a
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'A'
    @profile_card.save
  end

  def download_b
    @profile_card = ProfileCard.find(download_params[:id])
    image = @profile_card.profile_card_data_b
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'B'
    @profile_card.save
  end

  def download_c
    @profile_card = ProfileCard.find(download_params[:id])
    image = @profile_card.profile_card_data_c
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'C'
    @profile_card.save
  end

  def download_d
    @profile_card = ProfileCard.find(download_params[:id])
    image = @profile_card.profile_card_data_d
    send_data(image.read, filename: "#{@profile_card.name}ちゃんのプロフィールカード.png")
    @profile_card.card_type = 'D'
    @profile_card.save
  end

  private

  def profile_card_params
    params.require(:profile_card).permit(:breed_id, :name, :gender, :birthday, :face_image, :face_image_cache, :pad_image, :pad_image_cache, :favorite_treat, :favorite_toy, )
  end

  def download_params
    params.permit(:id)
  end
end
