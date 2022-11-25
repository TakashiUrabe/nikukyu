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
      @profile_card = current_user.profile_cards.new(profile_card_params)
    end
    cookies[:kind] = params[:profile_card][:kind]
    if @profile_card.save
      cookies[:nikukyu_id] = @profile_card.id
      unless current_user.nil?
        cookies.delete :nikukyu_id
      end
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
    @ogp_img = "ogp_result_#{@profile_card.personality}.png"
  end

  def show
    @profile_card = ProfileCard.find(params[:id])
    @ogp_img = @profile_card.select_ogp
  end

  def edit
    @user = User.new
    @profile_card = ProfileCard.find(params[:id])
    @ogp_img = @profile_card.select_ogp
    # if @profile_card.user_id == current_user&.id || @profile_card.id == cookies[:nikukyu_id]
    # else
    #   flash[:notice] = 'アクセス権限がありません'
    #   redirect_to action: :show
    # end
  end

  def update
    @profile_card = ProfileCard.find(params[:id])
    if @profile_card.update(profile_card_params) && @profile_card.face_image.url != 'face_image_sample.png'
      cookies.delete :kind
      @profile_card.create_profile_card
      @profile_card.profile_card_data_a = File.open("./app/assets/images/profile_card_data_a.jpg","r")
      @profile_card.profile_card_data_b = File.open("./app/assets/images/profile_card_data_b.jpg","r")
      @profile_card.profile_card_data_c = File.open("./app/assets/images/profile_card_data_c.jpg","r")
      @profile_card.profile_card_data_d = File.open("./app/assets/images/profile_card_data_d.jpg","r")
      @profile_card.save
      redirect_to edit_profile_card_path(@profile_card), success:'カードができました！'
    else
      flash.now[:danger] = '入力項目が受け付けられませんでした'
      render :edit, status: :unprocessable_entity
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
