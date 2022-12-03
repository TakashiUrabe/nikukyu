class ProfileCard < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'

  belongs_to :user, optional: true
  belongs_to :breed, optional: true

  validates :name, presence: true, length: {maximum: 15}
  validates :pad_image, presence: true

  mount_uploader :pad_image, PadImageUploader
  mount_uploader :face_image, FaceImageUploader
  mount_uploader :profile_card_data_a, ProfileCardDataUploader
  mount_uploader :profile_card_data_b, ProfileCardDataUploader
  mount_uploader :profile_card_data_c, ProfileCardDataUploader
  mount_uploader :profile_card_data_d, ProfileCardDataUploader

  enum gender: { male: 1, female: 2 }
  enum personality: { typeA: 1, typeB: 2, typeC: 3, typeD: 4, typeE: 5, typeF: 6, typeG: 7, typeH: 8, typeI: 9, typeJ: 10}
  enum card_type: {hide: 1, A: 2, B: 3, C: 4, D: 5}

  def user_id_setting(id)
    self.user_id = id
    save
  end

  def image_recognition(file, kind)
    if kind == '1'
      dog_image_recognition(file)
    else
      cat_image_recoginition(file)
    end
  end

  def dog_image_recognition(file)
    uri = URI('https://productdogpad-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/1e6387fe-c18f-4bf5-b3d8-321ba0526d81/classify/iterations/product_dog_classification/url')
    uri.query = URI.encode_www_form({
                                      # Request parameters
                                      'application' => '{string}'
                                    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Prediction-key'] = '9ca9a8130da44fa5bb21339c2cb704c1'
    # Request body
    request.body = "{Url: '#{file}'}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    result = response.body
    JSON.parse(result)['predictions'][0]['tagName']
  end

  def cat_image_recoginition(file)
    uri = URI('https://productcatpad-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/a5313cec-758a-4928-9813-b6f3d1c15765/classify/iterations/product_cat_classification2/url')
    uri.query = URI.encode_www_form({
                                      # Request parameters
                                      'application' => '{string}'
                                    })

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/json'
    # Request headers
    request['Prediction-key'] = 'a5974b9f15854ad284650cff9b52f13b'
    # Request body
    request.body = "{Url: '#{file}'}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end

    result = response.body
    JSON.parse(result)['predictions'][0]['tagName']
  end

  require 'rmagick'
  include Magick

  def create_profile_card
    create_profile_card_a(self)
    create_profile_card_b(self)
    create_profile_card_c(self)
    create_profile_card_d(self)
  end

  def create_profile_card_a(profile_card)
    base_img = ImageList.new('./app/assets/images/base_img_a.png')

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = '#3d3b3e'
    draw.stroke    = 'transparent'
    draw.pointsize = 40
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, -200, -85, profile_card.personality_i18n)
    draw.font      = 'app/assets/fonts/NotoSansJP-Regular.otf'
    draw.pointsize = 30
    draw.annotate(base_img, 0, 0, -200, -35, "誕生日：#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, -200, 10, "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, -200, 55, "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, -200, 100, "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.annotate(base_img, 0, 0, -200, -150, profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(300, 300)
    img2 = Magick::Image.new(profile_face_image.columns, profile_face_image.rows)
    img2 = img2.matte_reset!

    idr = Draw.new
    idr.fill = 'white'
    idr.ellipse(profile_face_image.columns / 2, profile_face_image.rows / 2,
                profile_face_image.columns / 2, profile_face_image.rows / 2, 0, 360)
    idr.draw(img2)

    img3 = profile_face_image.composite(img2, 0, 0, CopyAlphaCompositeOp)

    base_img.composite!(img3 , 900, 100, OverCompositeOp)
    # ここまで

    base_img.write('./app/assets/images/profile_card_data_a.jpg') # save to file
  end

  def create_profile_card_b(profile_card)
    base_img = ImageList.new('./app/assets/images/base_img_b.png')

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = '#3d3b3e'
    draw.stroke    = 'transparent'
    draw.pointsize = 40
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, -100, -90, profile_card.personality_i18n)
    draw.font      = 'app/assets/fonts/NotoSansJP-Regular.otf'
    draw.pointsize = 30
    draw.annotate(base_img, 0, 0, -100, -40, "誕生日：#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, -100, 5, "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, -100, 50, "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, -100, 95, "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.annotate(base_img, 0, 0, -100, -150, profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(300, 300)
    img2 = Magick::Image.new(profile_face_image.columns, profile_face_image.rows)
    img2 = img2.matte_reset!

    idr = Draw.new
    idr.fill = 'white'
    idr.ellipse(profile_face_image.columns / 2, profile_face_image.rows / 2,
                profile_face_image.columns / 2, profile_face_image.rows / 2, 0, 360)
    idr.draw(img2)

    img3 = profile_face_image.composite(img2, 0, 0, CopyAlphaCompositeOp)

    base_img.composite!(img3 , 980, 120, OverCompositeOp)
    # ここまで

    base_img.write('./app/assets/images/profile_card_data_b.jpg') # save to file
  end

  def create_profile_card_c(profile_card)
    base_img = ImageList.new('./app/assets/images/base_img_c.png')

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = 'white'
    draw.stroke    = 'transparent'
    draw.pointsize = 40
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, -270, -60, profile_card.personality_i18n)
    draw.font      = 'app/assets/fonts/NotoSansJP-Regular.otf'
    draw.pointsize = 30
    draw.annotate(base_img, 0, 0, -270, -10, "誕生日：#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, -270, 35, "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, -270, 80, "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, -270, 125, "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.fill = '#d8b469'
    draw.annotate(base_img, 0, 0, -270, -140, profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(300, 300)
    img2 = Magick::Image.new(profile_face_image.columns, profile_face_image.rows)
    img2 = img2.matte_reset!

    idr = Draw.new
    idr.fill = 'white'
    idr.ellipse(profile_face_image.columns / 2, profile_face_image.rows / 2,
                profile_face_image.columns / 2, profile_face_image.rows / 2, 0, 360)
    idr.draw(img2)

    img3 = profile_face_image.composite(img2, 0, 0, CopyAlphaCompositeOp)

    base_img.composite!(img3 , 820, 100, OverCompositeOp)
    # ここまで

    base_img.write('./app/assets/images/profile_card_data_c.jpg') # save to file
  end

  def create_profile_card_d(profile_card)
    base_img = ImageList.new('./app/assets/images/base_img_d.jpeg')

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = '#3d3b3e'
    draw.stroke    = 'transparent'
    draw.pointsize = 40
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, -20, -150, profile_card.personality_i18n)
    draw.font      = 'app/assets/fonts/NotoSansJP-Regular.otf'
    draw.pointsize = 30
    draw.annotate(base_img, 0, 0, -20, 5, "誕生日：#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, -20, 50, "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, -20, 95, "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, -20, 140, "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.annotate(base_img, 0, 0, -20, -75, profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(300, 300)
    img2 = Magick::Image.new(profile_face_image.columns, profile_face_image.rows)
    img2 = img2.matte_reset!

    idr = Draw.new
    idr.fill = 'white'
    idr.ellipse(profile_face_image.columns / 2, profile_face_image.rows / 2,
                profile_face_image.columns / 2, profile_face_image.rows / 2, 0, 360)
    idr.draw(img2)

    img3 = profile_face_image.composite(img2, 0, 0, CopyAlphaCompositeOp)

    base_img.composite!(img3 , 1000, 120, OverCompositeOp)
    # ここまで

    base_img.write('./app/assets/images/profile_card_data_d.jpg') # save to file
  end

  def save_profile_card
    self.profile_card_data_a = File.open('./app/assets/images/profile_card_data_a.jpg', 'r')
    self.profile_card_data_b = File.open('./app/assets/images/profile_card_data_b.jpg', 'r')
    self.profile_card_data_c = File.open('./app/assets/images/profile_card_data_c.jpg', 'r')
    self.profile_card_data_d = File.open('./app/assets/images/profile_card_data_d.jpg', 'r')
    save
  end
end
