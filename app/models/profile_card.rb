class ProfileCard < ApplicationRecord
  require 'net/http'
  require 'json'

  belongs_to :user, optional: true
  belongs_to :breed, optional: true

  mount_uploader :pad_image, PadImageUploader
  mount_uploader :face_image, FaceImageUploader
  mount_uploader :binarize_image, BinarizeImageUploader
  mount_uploader :profile_card_data_a, ProfileCardDataUploader
  mount_uploader :profile_card_data_b, ProfileCardDataUploader
  mount_uploader :profile_card_data_c, ProfileCardDataUploader
  mount_uploader :profile_card_data_d, ProfileCardDataUploader

  enum gender: { male: 1, female: 2 }
  enum personality: { typeA: 1, typeB: 2, typeC: 3, typeD: 4, typeE: 5 }

  def user_id_setting(id)
    self.user_id = id
    self.save
  end

  def image_recognition(file,kind)
    if kind == "1"
      self.dog_image_recognition(file)
    else
      self.cat_image_recoginition(file)
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
    JSON.parse(result)["predictions"][0]["tagName"]
  end

  def cat_image_recoginition(file)
    uri = URI('https://productcatpad-prediction.cognitiveservices.azure.com/customvision/v3.0/Prediction/a5313cec-758a-4928-9813-b6f3d1c15765/classify/iterations/product_cat_classification/url')
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
    JSON.parse(result)["predictions"][0]["tagName"]
  end

  require 'RMagick'
  include Magick

  #遠い色はとばす
  def change_color(file)
    img = ImageList.new(file)
    compare = Magick::Pixel.new(49*256,50*256,54*256) # この色から遠い領域を探す
    replace = Magick::Pixel.new(255*256,255*256,255*256) # この色で塗りつぶす
    for y in 0...img.rows
      for x in 0...img.columns
        src = img.pixel_color(x, y) # 元画像のピクセルを取得

        dr = src.red - compare.red # 赤要素の差
        dg = src.green - compare.green # 緑要素の差
        db = src.blue - compare.blue # 青要素の差

        # RGB空間上において2つの色が遠ければ塗りつぶす
        img.pixel_color(x, y, replace)if dr*dr + dg*dg + db*db > (50*256*50*256)*3
      end
    end
    img
  end

  # 2値化する
  def binarize(file, t)
    img = ImageList.new(file)
    gray_img = img.quantize(256, GRAYColorspace)
    bin_img = gray_img.threshold(t*256.to_i)
    bin_img.write("app/assets/images/bin_img.jpg")
  end

  def create_histogram(gray_img)
    hist = Array.new(256, 0)
    [*0...gray_img.rows].product([*0...gray_img.columns]).each{ |(y, x)|
      b = gray_img.pixel_color(y, x)
      b = 0.299*b.red/256+0.587*b.green/256+0.114*b.blue/256
      hist[b.round] += 1
    }
    hist
  end

  # 判別分析法（大津の2値化）
  def discriminant(file)
    img = ImageList.new(file)
    gray_img = img.quantize(256, GRAYColorspace)
    hist = create_histogram(gray_img)
    eval_value, best_t = 0, 0
    (0...255).each{ |t|
      # t := 閾値
      # w1(w2) := 左側(右側)の画素数
      # m1(m2) := 左側(右側)の平均
      w1, w2 = 0, 0
      m1, m2 = 0, 0

      w1 = hist[0..t].reduce(:+)
      m1 = hist[0..t].map.with_index {|n, idx| n * idx}.reduce(:+)/w1 rescue 0

      w2 = hist[t+1..255].reduce(:+)
      m2 = hist[t+1..255].map.with_index(t+1) {|n, idx| n * idx}.reduce(:+)/w2 rescue 0

      e = w1 * w2 * (m1 - m2) ** 2
      if eval_value < e
        eval_value = e
        best_t = t
      end
    }
    best_t
  end

  def binarize_otsu(file)
    t_dis = discriminant(file)
    binarize(file, t_dis)
  end

  def create_profile_card(profile_card)
    base_img = ImageList.new("app/assets/images/base_img.jpg")

    draw = Draw.new
    draw.font      = 'app/assets/fonts/NotoSansJP-Medium.otf'
    draw.fill      = '#3d3b3e'
    draw.stroke    = 'transparent'
    draw.pointsize = 20
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, 0, -100, profile_card.personality_i18n)
    draw.annotate(base_img, 0, 0, 0, -20, profile_card.gender_i18n)
    draw.annotate(base_img, 0, 0, 0, 10, "誕生日:#{I18n.l profile_card.birthday}")
    draw.annotate(base_img, 0, 0, 0, 40, "犬種:#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, 0, 70, "好きな食べ物:#{profile_card.favorite_treat}")
    draw.annotate(base_img, 0, 0, 0, 100, "好きな食べ物:#{profile_card.favorite_toy}")

    draw.font = 'app/assets/fonts/NotoSansJP-Medium.otf'
    draw.pointsize = 30
    draw.annotate(base_img, 0, 0, 0, -60, profile_card.name)

    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize(200, 200)

    img2 = Image.new(profile_face_image.columns, profile_face_image.rows)
    img2 = img2.matte_reset!

    idr = Draw.new
    idr.fill = "white"
    idr.ellipse(profile_face_image.columns/2,profile_face_image.rows/2,
    profile_face_image.columns/2,profile_face_image.rows/2,0,360);
    idr.draw(img2);

    img3 = profile_face_image.composite(img2, 0, 0, CopyAlphaCompositeOp)

    base_img.composite!(img3 , 50, 200, OverCompositeOp)

    base_img.write("app/assets/images/profile_card_data_a.jpg") # save to file
  end

end
