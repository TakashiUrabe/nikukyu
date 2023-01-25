module CreateProfileCard
  require 'rmagick'
  include Magick

  def create_profile_card(type)
    hash_a = {'base_img_url': './app/assets/images/base_img_a.png', 'color': '#3d3b3e', 'personality_position': [-200,-85], 'birthday_position': [-200,-35], 'breed_position': [-200,10], 'treat_position': [-200,55], 'toy_position': [-200,100], 'name_color': '#3d3b3e', 'name_position': [-200,-150], 'face_position': [900,100], 'write_url': './app/assets/images/profile_card_data_a.jpg'}

    hash_b = {'base_img_url': './app/assets/images/base_img_b.png', 'color': '#3d3b3e', 'personality_position': [-100,-90], 'birthday_position': [-100,-40], 'breed_position': [-100,5], 'treat_position': [-100,50], 'toy_position': [-100,95], 'name_color': '#3d3b3e', 'name_position': [-100,-150], 'face_position': [980,120], 'write_url': './app/assets/images/profile_card_data_b.jpg'}

    hash_c = {'base_img_url': './app/assets/images/base_img_c.png', 'color': 'white', 'personality_position': [-270,-60], 'birthday_position': [-270,-10], 'breed_position': [-270,35], 'treat_position': [-270,80], 'toy_position': [-270,125], 'name_color': '#d8b469', 'name_position': [-270,-140], 'face_position': [820,100], 'write_url': './app/assets/images/profile_card_data_c.jpg'}

    hash_d = {'base_img_url': './app/assets/images/base_img_d.jpg', 'color': '#3d3b3e', 'personality_position': [-20,-150], 'birthday_position': [-20,5], 'breed_position': [-20,50], 'treat_position': [-20,95], 'toy_position': [-20,140], 'name_color': '#3d3b3e', 'name_position': [-20,-75], 'face_position': [1000,120], 'write_url': './app/assets/images/profile_card_data_d.jpg'}

    hash_g = {'base_img_url': './app/assets/images/base_img_g.png', 'color': '#3d3b3e', 'personality_position': [60,580], 'birthday_position': [60,640], 'breed_position': [60,685], 'treat_position': [60,730], 'toy_position': [60,775], 'name_color': '#3d3b3e', 'name_position': [200,-710], 'face_position': [0,320], 'write_url': './app/assets/images/profile_card_data_g.jpg'}

    hash_h = {'base_img_url': './app/assets/images/base_img_h.png', 'color': '#3d3b3e', 'personality_position': [0,-650], 'birthday_position': [0,-590], 'breed_position': [0,-535], 'treat_position': [0,-480], 'toy_position': [0,-425], 'name_color': '#3d3b3e', 'name_position': [0,-720], 'face_position': [0,600], 'write_url': './app/assets/images/profile_card_data_h.jpg'}

    hash_i = {'base_img_url': './app/assets/images/base_img_i.png', 'color': 'white', 'personality_position': [0,50], 'birthday_position': [0,-850], 'breed_position': [0,-790], 'treat_position': [0,-730], 'toy_position': [0,-670], 'name_color': 'white', 'name_position': [0,130], 'face_position': [90,350], 'write_url': './app/assets/images/profile_card_data_i.jpg'}

    hash_j = {'base_img_url': './app/assets/images/base_img_j.png', 'color': '#4d443e', 'personality_position': [0,400], 'birthday_position': [50,-850], 'breed_position': [50,-790], 'treat_position': [50,-730], 'toy_position': [50,-670], 'name_color': '#989cbc', 'name_position': [0,480], 'face_position': [90,550], 'write_url': './app/assets/images/profile_card_data_j.jpg'}

    # hash_alphabet_a = {'alphabet': 'A', 'hash': hash_a, 'profile_card_data_alphabet': self.profile_card_data_a, 'url_alphabet': hash_a[:write_url]}
    # hash_alphabet_b = {'alphabet': 'B', 'hash': hash_b, 'profile_card_data_alphabet': self.profile_card_data_b, 'url_alphabet': hash_b[:write_url]}
    # hash_alphabet_c = {'alphabet': 'C', 'hash': hash_c, 'profile_card_data_alphabet': self.profile_card_data_c, 'url_alphabet': hash_c[:write_url]}
    # hash_alphabet_d = {'alphabet': 'D', 'hash': hash_d, 'profile_card_data_alphabet': self.profile_card_data_d, 'url_alphabet': hash_d[:write_url]}
    # [hash_alphabet_a, hash_alphabet_b, hash_alphabet_c, hash_alphabet_d].each do |hash_each|
    #   if type == hash_each[:alphabet]
    #     create_profile_card_data(self,hash_each[:hash])
    #     hash_each[:profile_card_data_alphabet] = File.open(hash_each[:url_alphabet], 'r')
    #   end
    #   save
    # end

    if type == "A"
      create_profile_card_data(self,hash_a)
      self.profile_card_data_a = File.open(hash_a[:write_url], 'r')
      save
    end
    if type == "B"
      create_profile_card_data(self,hash_b)
      self.profile_card_data_b = File.open(hash_b[:write_url], 'r')
      save
    end
    if type == "C"
      create_profile_card_data(self,hash_c)
      self.profile_card_data_c = File.open(hash_c[:write_url], 'r')
      save
    end
    if type == "D"
      create_profile_card_data(self,hash_d)
      self.profile_card_data_d = File.open(hash_d[:write_url], 'r')
      save
    end
    if type == "G"
      instagram_create_profile_card_data_g(self,hash_g)
      self.profile_card_data_g = File.open(hash_g[:write_url], 'r')
      save
    end
    if type == "H"
      instagram_create_profile_card_data_h(self,hash_h)
      self.profile_card_data_h = File.open(hash_h[:write_url], 'r')
      save
    end
    if type == "I"
      instagram_create_profile_card_data_i(self,hash_i)
      self.profile_card_data_i = File.open(hash_i[:write_url], 'r')
      save
    end
    if type == "J"
      instagram_create_profile_card_data_j(self,hash_j)
      self.profile_card_data_j = File.open(hash_j[:write_url], 'r')
      save
    end
  end

  def create_profile_card_data(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.pointsize = 40
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)
    draw.font      = 'app/assets/fonts/NotoSansJP-Regular.otf'
    draw.pointsize = 30
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

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

    base_img.composite!(img3, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img.write(hash[:write_url])
  end

  def instagram_create_profile_card_data_g(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.pointsize = 40
    draw.gravity   = WestGravity
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)
    draw.font      = 'app/assets/fonts/NotoSansJP-Regular.otf'
    draw.pointsize = 30
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(1080, 1080)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img.write(hash[:write_url])
  end

  def instagram_create_profile_card_data_h(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.pointsize = 50
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)
    draw.font      = 'app/assets/fonts/NotoSansJP-Regular.otf'
    draw.pointsize = 35
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 70
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(1080, 1080)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_h_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end

  def instagram_create_profile_card_data_i(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.gravity   = CenterGravity
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.pointsize = 40
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday}  #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(900, 900)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_i_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)


    draw.pointsize = 50
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 90
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_j(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.gravity   = WestGravity
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.pointsize = 40
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday} #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(900, 900)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_j_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    draw.gravity   = CenterGravity
    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 90
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.pointsize = 50
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)

    base_img.write(hash[:write_url])
  end
end
