module CreateProfileCard
  require 'rmagick'
  include Magick

  def create_profile_card(type)
    hash_a = {'base_img_url': './app/assets/images/base_img_a.png', 'color': '#3d3b3e', 'personality_position': [-200,-85], 'birthday_position': [-200,-35], 'breed_position': [-200,10], 'treat_position': [-200,55], 'toy_position': [-200,100], 'name_color': '#3d3b3e', 'name_position': [-200,-150], 'face_position': [900,100], 'write_url': './app/assets/images/profile_card_data_a.jpg'}

    hash_b = {'base_img_url': './app/assets/images/base_img_b.png', 'color': '#3d3b3e', 'personality_position': [-100,-90], 'birthday_position': [-100,-40], 'breed_position': [-100,5], 'treat_position': [-100,50], 'toy_position': [-100,95], 'name_color': '#3d3b3e', 'name_position': [-100,-150], 'face_position': [980,120], 'write_url': './app/assets/images/profile_card_data_b.jpg'}

    hash_c = {'base_img_url': './app/assets/images/base_img_c.png', 'color': 'white', 'personality_position': [-270,-60], 'birthday_position': [-270,-10], 'breed_position': [-270,35], 'treat_position': [-270,80], 'toy_position': [-270,125], 'name_color': '#d8b469', 'name_position': [-270,-140], 'face_position': [820,100], 'write_url': './app/assets/images/profile_card_data_c.jpg'}

    hash_d = {'base_img_url': './app/assets/images/base_img_d.jpg', 'color': '#3d3b3e', 'personality_position': [-20,-150], 'birthday_position': [-20,5], 'breed_position': [-20,50], 'treat_position': [-20,95], 'toy_position': [-20,140], 'name_color': '#3d3b3e', 'name_position': [-20,-75], 'face_position': [1000,120], 'write_url': './app/assets/images/profile_card_data_d.jpg'}

    hash_e = {'base_img_url': './app/assets/images/base_img_e.png', 'color': '#3d3b3e', 'personality_position': [-200,-170], 'birthday_position': [-200,-60], 'breed_position': [-200,-15], 'treat_position': [-200,30], 'toy_position': [-200,75], 'name_color': '#3d3b3e', 'name_position': [-200,-110], 'face_position': [800,0], 'write_url': './app/assets/images/profile_card_data_e.jpg'}

    hash_f = {'base_img_url': './app/assets/images/base_img_f.png', 'color': '#3d3b3e', 'personality_position': [0,-170], 'birthday_position': [0,-60], 'breed_position': [0,-15], 'treat_position': [0,30], 'toy_position': [0,75], 'name_color': '#3d3b3e', 'name_position': [0,-110], 'face_position': [1000,25], 'write_url': './app/assets/images/profile_card_data_f.jpg'}

    hash_g = {'base_img_url': './app/assets/images/base_img_g.png', 'color': '#3d3b3e', 'personality_position': [60,580], 'birthday_position': [60,640], 'breed_position': [60,685], 'treat_position': [60,730], 'toy_position': [60,775], 'name_color': '#3d3b3e', 'name_position': [200,-710], 'face_position': [0,320], 'write_url': './app/assets/images/profile_card_data_g.jpg'}

    hash_h = {'base_img_url': './app/assets/images/base_img_h.png', 'color': '#3d3b3e', 'personality_position': [0,-650], 'birthday_position': [0,-590], 'breed_position': [0,-535], 'treat_position': [0,-480], 'toy_position': [0,-425], 'name_color': '#3d3b3e', 'name_position': [0,-720], 'face_position': [0,600], 'write_url': './app/assets/images/profile_card_data_h.jpg'}

    hash_i = {'base_img_url': './app/assets/images/base_img_i.png', 'color': 'white', 'personality_position': [0,50], 'birthday_position': [0,-850], 'breed_position': [0,-790], 'treat_position': [0,-730], 'toy_position': [0,-670], 'name_color': 'white', 'name_position': [0,150], 'face_position': [90,350], 'write_url': './app/assets/images/profile_card_data_i.jpg'}

    hash_j = {'base_img_url': './app/assets/images/base_img_j.png', 'color': '#4d443e', 'personality_position': [0,400], 'birthday_position': [50,-850], 'breed_position': [50,-790], 'treat_position': [50,-730], 'toy_position': [50,-670], 'name_color': '#989cbc', 'name_position': [0,480], 'face_position': [90,550], 'write_url': './app/assets/images/profile_card_data_j.jpg'}

    hash_k = {'base_img_url': './app/assets/images/base_img_k.png', 'color': '#3d3b3e', 'personality_position': [0,-850], 'birthday_position': [0,-790], 'breed_position': [0,-735], 'treat_position': [0,-680], 'toy_position': [0,-625], 'name_color': '#3d3b3e', 'name_position': [0,360], 'face_position': [220,540], 'write_url': './app/assets/images/profile_card_data_k.jpg'}

    hash_l = {'base_img_url': './app/assets/images/base_img_l.png', 'color': '#594a47', 'personality_position': [0,-900], 'birthday_position': [0,-670], 'breed_position': [0,-615], 'treat_position': [0,-560], 'toy_position': [0,-505], 'name_color': '#594a47', 'name_position': [0,-790], 'face_position': [150,490], 'write_url': './app/assets/images/profile_card_data_l.jpg'}

    hash_m = {'base_img_url': './app/assets/images/base_img_m.png', 'color': '#3d3b3e', 'personality_position': [60,580], 'birthday_position': [60,640], 'breed_position': [60,685], 'treat_position': [60,730], 'toy_position': [60,775], 'name_color': '#3d3b3e', 'name_position': [200,-990], 'face_position': [0,900], 'write_url': './app/assets/images/profile_card_data_m.jpg'}

    hash_n = {'base_img_url': './app/assets/images/base_img_n.png', 'color': '#3d3b3e', 'personality_position': [0,-650], 'birthday_position': [0,-590], 'breed_position': [0,-535], 'treat_position': [0,-480], 'toy_position': [0,-425], 'name_color': '#3d3b3e', 'name_position': [0,-720], 'face_position': [0,1100], 'write_url': './app/assets/images/profile_card_data_n.jpg'}

    hash_o = {'base_img_url': './app/assets/images/base_img_o.png', 'color': 'white', 'personality_position': [0,50], 'birthday_position': [0,-850], 'breed_position': [0,-790], 'treat_position': [0,-730], 'toy_position': [0,-670], 'name_color': 'white', 'name_position': [0,150], 'face_position': [90,800], 'write_url': './app/assets/images/profile_card_data_o.jpg'}

    hash_p = {'base_img_url': './app/assets/images/base_img_p.png', 'color': '#4d443e', 'personality_position': [0,400], 'birthday_position': [50,-850], 'breed_position': [50,-790], 'treat_position': [50,-730], 'toy_position': [50,-670], 'name_color': '#989cbc', 'name_position': [0,480], 'face_position': [90,1150], 'write_url': './app/assets/images/profile_card_data_p.jpg'}

    hash_q = {'base_img_url': './app/assets/images/base_img_q.png', 'color': '#3d3b3e', 'personality_position': [0,-850], 'birthday_position': [0,-790], 'breed_position': [0,-735], 'treat_position': [0,-680], 'toy_position': [0,-625], 'name_color': '#3d3b3e', 'name_position': [0,360], 'face_position': [205,910], 'write_url': './app/assets/images/profile_card_data_q.jpg'}

    hash_r = {'base_img_url': './app/assets/images/base_img_r.png', 'color': '#594a47', 'personality_position': [0,-900], 'birthday_position': [0,-670], 'breed_position': [0,-615], 'treat_position': [0,-560], 'toy_position': [0,-505], 'name_color': '#594a47', 'name_position': [0,-790], 'face_position': [160,770], 'write_url': './app/assets/images/profile_card_data_r.jpg'}

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
    if type == "E"
      create_profile_card_data_e(self,hash_e)
      self.profile_card_data_e = File.open(hash_e[:write_url], 'r')
      save
    end
    if type == "F"
      create_profile_card_data_f(self,hash_f)
      self.profile_card_data_f = File.open(hash_f[:write_url], 'r')
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
    if type == "K"
      instagram_create_profile_card_data_k(self,hash_k)
      self.profile_card_data_k = File.open(hash_k[:write_url], 'r')
      save
    end
    if type == "L"
      instagram_create_profile_card_data_l(self,hash_l)
      self.profile_card_data_l = File.open(hash_l[:write_url], 'r')
      save
    end
    if type == "M"
      instagram_create_profile_card_data_m(self,hash_m)
      self.profile_card_data_m = File.open(hash_m[:write_url], 'r')
      save
    end
    if type == "N"
      instagram_create_profile_card_data_n(self,hash_n)
      self.profile_card_data_n = File.open(hash_n[:write_url], 'r')
      save
    end
    if type == "O"
      instagram_create_profile_card_data_o(self,hash_o)
      self.profile_card_data_o = File.open(hash_o[:write_url], 'r')
      save
    end
    if type == "P"
      instagram_create_profile_card_data_p(self,hash_p)
      self.profile_card_data_p = File.open(hash_p[:write_url], 'r')
      save
    end
    if type == "Q"
      instagram_create_profile_card_data_q(self,hash_q)
      self.profile_card_data_q = File.open(hash_q[:write_url], 'r')
      save
    end
    if type == "R"
      instagram_create_profile_card_data_r(self,hash_r)
      self.profile_card_data_r = File.open(hash_r[:write_url], 'r')
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

  def create_profile_card_data_e(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(500, 500)
    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_e_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

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

    base_img.write(hash[:write_url])
  end

  def create_profile_card_data_f(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(450, 450)
    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

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
    draw.pointsize = 35
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday}  #{profile_card.gender_i18n}")
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
  def instagram_create_profile_card_data_k(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.pointsize = 50
    draw.gravity   = CenterGravity
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)

    draw.pointsize = 35
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday}  #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 70
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(680, 680)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_k_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_l(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.gravity   = CenterGravity
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.pointsize = 40
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday} #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きな食べ物：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(800, 800)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_l_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 90
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.pointsize = 50
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_m(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.pointsize = 40
    draw.gravity   = WestGravity

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(1170, 1170)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_n(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.pointsize = 50
    draw.gravity   = CenterGravity

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(1170, 1170)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_n_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_o(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.gravity   = CenterGravity

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(1000, 1000)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_o_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    draw.pointsize = 50
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_p(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.gravity   = WestGravity

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(1000, 1000)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_p_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_q(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.stroke    = 'transparent'
    draw.gravity   = CenterGravity

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(800, 800)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_q_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end
  def instagram_create_profile_card_data_r(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.stroke    = 'transparent'
    draw.gravity   = CenterGravity

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/remove_bg.png').first.resize_to_fill(900, 900)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img_r_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end
end
