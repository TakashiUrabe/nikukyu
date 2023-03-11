module CreateProfileCard
  require 'rmagick'
  include Magick

  def create_profile_card(type)
    hash_a = {'type': 'A' ,'base_img_url': './app/assets/images/base_img/twitter/base_img_a.png', 'color': '#3d3b3e', 'personality_position': [-200,-85], 'birthday_position': [-200,-35], 'breed_position': [-200,10], 'treat_position': [-200,55], 'toy_position': [-200,100], 'name_color': '#3d3b3e', 'name_position': [-200,-150], 'face_position': [900,100], 'write_url': './app/assets/images/user/profile_card_data_a.jpg', 'twitter_write_url': './app/assets/images/user/twitter_share_profile_card_data_a.jpg'}

    hash_b = {'type': 'B' ,'base_img_url': './app/assets/images/base_img/twitter/base_img_b.png', 'color': '#3d3b3e', 'personality_position': [-100,-90], 'birthday_position': [-100,-40], 'breed_position': [-100,5], 'treat_position': [-100,50], 'toy_position': [-100,95], 'name_color': '#3d3b3e', 'name_position': [-100,-150], 'face_position': [980,120], 'write_url': './app/assets/images/user/profile_card_data_b.jpg', 'twitter_write_url': './app/assets/images/user/twitter_share_profile_card_data_b.jpg'}

    hash_c = {'type': 'C' ,'base_img_url': './app/assets/images/base_img/twitter/base_img_c.png', 'color': 'white', 'personality_position': [-270,-60], 'birthday_position': [-270,-10], 'breed_position': [-270,35], 'treat_position': [-270,80], 'toy_position': [-270,125], 'name_color': '#d8b469', 'name_position': [-270,-140], 'face_position': [820,100], 'write_url': './app/assets/images/user/profile_card_data_c.jpg', 'twitter_write_url': './app/assets/images/user/twitter_share_profile_card_data_c.jpg'}

    hash_d = {'type': 'D' ,'base_img_url': './app/assets/images/base_img/twitter/base_img_d.jpg', 'color': '#3d3b3e', 'personality_position': [-20,-150], 'birthday_position': [-20,5], 'breed_position': [-20,50], 'treat_position': [-20,95], 'toy_position': [-20,140], 'name_color': '#3d3b3e', 'name_position': [-20,-75], 'face_position': [1000,120], 'write_url': './app/assets/images/user/profile_card_data_d.jpg', 'twitter_write_url': './app/assets/images/user/twitter_share_profile_card_data_d.jpg'}

    hash_e = {'type': 'E' ,'base_img_url': './app/assets/images/base_img/twitter/base_img_e.png', 'color': '#3d3b3e', 'personality_position': [-200,-170], 'birthday_position': [-200,-60], 'breed_position': [-200,-15], 'treat_position': [-200,30], 'toy_position': [-200,75], 'name_color': '#3d3b3e', 'name_position': [-200,-110], 'face_position': [800,0], 'write_url': './app/assets/images/user/profile_card_data_e.jpg', 'twitter_write_url': './app/assets/images/user/twitter_share_profile_card_data_e.jpg', 'face_image_size': [500,500], 'sticker': 'app/assets/images/base_img/twitter/base_img_e_sticker.png'}

    hash_f = {'type': 'F' ,'base_img_url': './app/assets/images/base_img/twitter/base_img_f.png', 'color': '#76501c', 'personality_position': [-150,-150], 'birthday_position': [-150,-100], 'breed_position': [-150,-55], 'treat_position': [-150,-10], 'toy_position': [-150,35], 'name_color': '#76501c', 'name_position': [-150,-200], 'face_position': [850,100], 'write_url': './app/assets/images/user/profile_card_data_f.jpg', 'twitter_write_url': './app/assets/images/user/twitter_share_profile_card_data_f.jpg', 'face_image_size': [400,400], 'sticker': 'app/assets/images/base_img/twitter/base_img_f_sticker.png'}

    hash_g = {'type': 'G' ,'base_img_url': './app/assets/images/base_img/instagram/base_img_g.png', 'color': '#3d3b3e', 'personality_position': [60,580], 'birthday_position': [60,640], 'breed_position': [60,685], 'treat_position': [60,730], 'toy_position': [60,775], 'name_color': '#3d3b3e', 'name_position': [200,-710], 'face_position': [0,320], 'write_url': './app/assets/images/user/profile_card_data_g.jpg'}

    hash_h = {'type': 'H' ,'base_img_url': './app/assets/images/base_img/instagram/base_img_h.png', 'color': '#3d3b3e', 'personality_position': [0,-650], 'birthday_position': [0,-590], 'breed_position': [0,-535], 'treat_position': [0,-480], 'toy_position': [0,-425], 'name_color': '#3d3b3e', 'name_position': [0,-720], 'face_position': [0,600], 'write_url': './app/assets/images/user/profile_card_data_h.jpg', 'sticker': 'app/assets/images/base_img/instagram/base_img_h_sticker.png', 'face_image_size': [1080,1080], 'name_size': 70, 'others_size': 35, 'personality_color': '#3d3b3e', 'others_gravity': CenterGravity, 'name_personality_gravity': CenterGravity}

    hash_i = {'type': 'I' ,'base_img_url': './app/assets/images/base_img/instagram/base_img_i.png', 'color': 'white', 'personality_position': [0,50], 'birthday_position': [0,-850], 'breed_position': [0,-790], 'treat_position': [0,-730], 'toy_position': [0,-670], 'name_color': 'white', 'name_position': [0,150], 'face_position': [90,350], 'write_url': './app/assets/images/user/profile_card_data_i.jpg', 'sticker': 'app/assets/images/base_img/instagram/base_img_i_sticker.png', 'face_image_size': [900,900], 'name_size': 90, 'others_size': 40, 'personality_color': 'white', 'others_gravity': CenterGravity, 'name_personality_gravity': CenterGravity}

    hash_j = {'type': 'J' ,'base_img_url': './app/assets/images/base_img/instagram/base_img_j.png', 'color': '#4d443e', 'personality_position': [0,400], 'birthday_position': [50,-850], 'breed_position': [50,-790], 'treat_position': [50,-730], 'toy_position': [50,-670], 'name_color': '#989cbc', 'name_position': [0,480], 'face_position': [90,550], 'write_url': './app/assets/images/user/profile_card_data_j.jpg', 'sticker': 'app/assets/images/base_img/instagram/base_img_j_sticker.png', 'face_image_size': [900,900], 'name_size': 90, 'others_size': 40, 'personality_color': '#989cbc', 'others_gravity': WestGravity, 'name_personality_gravity': CenterGravity}

    hash_k = {'type': 'K' ,'base_img_url': './app/assets/images/base_img/instagram/base_img_k.png', 'color': '#3d3b3e', 'personality_position': [0,-850], 'birthday_position': [0,-790], 'breed_position': [0,-735], 'treat_position': [0,-680], 'toy_position': [0,-625], 'name_color': '#3d3b3e', 'name_position': [0,360], 'face_position': [220,540], 'write_url': './app/assets/images/user/profile_card_data_k.jpg'}

    hash_l = {'type': 'L' ,'base_img_url': './app/assets/images/base_img/instagram/base_img_l.png', 'color': '#76501c', 'personality_position': [0,-590], 'birthday_position': [0,-520], 'breed_position': [0,-465], 'treat_position': [0,-410], 'toy_position': [0,-355], 'name_color': '#76501c', 'name_position': [0,-700], 'face_position': [150,690], 'write_url': './app/assets/images/user/profile_card_data_l.jpg', 'sticker': 'app/assets/images/base_img/instagram/base_img_l_sticker.png', 'face_image_size': [800,800], 'name_size': 90, 'others_size': 40, 'personality_color': '#76501c', 'others_gravity': CenterGravity, 'name_personality_gravity': CenterGravity}

    hash_m = {'type': 'M' ,'base_img_url': './app/assets/images/base_img/wallpaper/base_img_m.png', 'color': '#3d3b3e', 'name_color': '#3d3b3e', 'name_position': [200,-990], 'face_position': [0,900], 'write_url': './app/assets/images/user/profile_card_data_m.jpg'}

    hash_n = {'type': 'N' ,'base_img_url': './app/assets/images/base_img/wallpaper/base_img_n.png', 'face_position': [0,1100], 'write_url': './app/assets/images/user/profile_card_data_n.jpg', 'sticker': 'app/assets/images/base_img/wallpaper/base_img_n_sticker.png', 'face_image_size': [1170,1170]}

    hash_o = {'type': 'O' ,'base_img_url': './app/assets/images/base_img/wallpaper/base_img_o.png', 'face_position': [90,800], 'write_url': './app/assets/images/user/profile_card_data_o.jpg', 'sticker': 'app/assets/images/base_img/wallpaper/base_img_o_sticker.png', 'face_image_size': [1000,1000]}

    hash_p = {'type': 'P' ,'base_img_url': './app/assets/images/base_img/wallpaper/base_img_p.png', 'face_position': [90,1150], 'write_url': './app/assets/images/user/profile_card_data_p.jpg', 'sticker': 'app/assets/images/base_img/wallpaper/base_img_p_sticker.png', 'face_image_size': [1000,1000]}

    hash_q = {'type': 'Q' ,'base_img_url': './app/assets/images/base_img/wallpaper/base_img_q.png', 'face_position': [205,910], 'write_url': './app/assets/images/user/profile_card_data_q.jpg'}

    hash_r = {'type': 'R' ,'base_img_url': './app/assets/images/base_img/wallpaper/base_img_r.png', 'face_position': [160,770], 'write_url': './app/assets/images/user/profile_card_data_r.jpg', 'sticker': 'app/assets/images/base_img/wallpaper/base_img_r_sticker.png', 'face_image_size': [900,900]}

    # array_hash_a_r = [hash_a, hash_b, hash_c, hash_d, hash_e, hash_f, hash_g, hash_h, hash_i, hash_j, hash_k, hash_l, hash_m, hash_n, hash_o, hash_p, hash_q]

    # array_hash_a_r. each do |hash|
    #   if type == hash[:type]
    #     create_profile_card_data(self,hash)
    #     hash[:profile_card_data_alphabet] = File.open(hash[:write_url], 'r')
    #     save
    #   end
    # end

    if type == "A"
      twitter_circle_create_profile_card_data(self,hash_a)
      self.profile_card_data_a = File.open(hash_a[:write_url], 'r')
      self.twitter_share_profile_card_data_a = File.open(hash_a[:twitter_write_url], 'r')
      save
    end
    if type == "B"
      twitter_circle_create_profile_card_data(self,hash_b)
      self.profile_card_data_b = File.open(hash_b[:write_url], 'r')
      self.twitter_share_profile_card_data_b = File.open(hash_b[:twitter_write_url], 'r')
      save
    end
    if type == "C"
      twitter_circle_create_profile_card_data(self,hash_c)
      self.profile_card_data_c = File.open(hash_c[:write_url], 'r')
      self.twitter_share_profile_card_data_c = File.open(hash_c[:twitter_write_url], 'r')
      save
    end
    if type == "D"
      twitter_circle_create_profile_card_data(self,hash_d)
      self.profile_card_data_d = File.open(hash_d[:write_url], 'r')
      self.twitter_share_profile_card_data_d = File.open(hash_d[:twitter_write_url], 'r')
      save
    end
    if type == "E"
      twitter_rembg_sticker_create_profile_card_data(self,hash_e)
      self.profile_card_data_e = File.open(hash_e[:write_url], 'r')
      self.twitter_share_profile_card_data_e = File.open(hash_e[:twitter_write_url], 'r')
      save
    end
    if type == "F"
      twitter_rembg_sticker_create_profile_card_data(self,hash_f)
      self.profile_card_data_f = File.open(hash_f[:write_url], 'r')
      self.twitter_share_profile_card_data_f = File.open(hash_f[:twitter_write_url], 'r')
      save
    end
    if type == "G"
      instagram_square_create_profile_card_data(self,hash_g)
      self.profile_card_data_g = File.open(hash_g[:write_url], 'r')
      save
    end
    if type == "H"
      instagram_rembg_sticker_create_profile_card_data(self,hash_h)
      self.profile_card_data_h = File.open(hash_h[:write_url], 'r')
      save
    end
    if type == "I"
      instagram_rembg_sticker_create_profile_card_data(self,hash_i)
      self.profile_card_data_i = File.open(hash_i[:write_url], 'r')
      save
    end
    if type == "J"
      instagram_rembg_sticker_create_profile_card_data(self,hash_j)
      self.profile_card_data_j = File.open(hash_j[:write_url], 'r')
      save
    end
    if type == "K"
      instagram_square_sticker_create_profile_card_data(self,hash_k)
      self.profile_card_data_k = File.open(hash_k[:write_url], 'r')
      save
    end
    if type == "L"
      instagram_rembg_sticker_create_profile_card_data(self,hash_l)
      self.profile_card_data_l = File.open(hash_l[:write_url], 'r')
      save
    end
    if type == "M"
      wallpaper_square_create_profile_card_data(self,hash_m)
      self.profile_card_data_m = File.open(hash_m[:write_url], 'r')
      save
    end
    if type == "N"
      wallpaper_rembg_sticker_create_profile_card_data(self,hash_n)
      self.profile_card_data_n = File.open(hash_n[:write_url], 'r')
      save
    end
    if type == "O"
      wallpaper_rembg_sticker_create_profile_card_data(self,hash_o)
      self.profile_card_data_o = File.open(hash_o[:write_url], 'r')
      save
    end
    if type == "P"
      wallpaper_rembg_sticker_create_profile_card_data(self,hash_p)
      self.profile_card_data_p = File.open(hash_p[:write_url], 'r')
      save
    end
    if type == "Q"
      wallpaper_square_sticker_create_profile_card_data(self,hash_q)
      self.profile_card_data_q = File.open(hash_q[:write_url], 'r')
      save
    end
    if type == "R"
      wallpaper_rembg_sticker_create_profile_card_data(self,hash_r)
      self.profile_card_data_r = File.open(hash_r[:write_url], 'r')
      save
    end
  end

  def twitter_circle_create_profile_card_data(profile_card, hash)
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
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きなおやつ：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
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
    twitter_share_base_img = ImageList.new('app/assets/images/base_img/twitter_share.png')
    twitter_share_base_img.composite!(base_img, 0, 144, OverCompositeOp)
    twitter_share_base_img.write(hash[:twitter_write_url])
  end

  def twitter_rembg_sticker_create_profile_card_data(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/user/remove_bg.png').first.resize_to_fill(hash[:face_image_size][0], hash[:face_image_size][1])
    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new(hash[:sticker])
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
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きなおやつ：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    base_img.write(hash[:write_url])
    twitter_share_base_img = ImageList.new('app/assets/images/base_img/twitter_share.png')
    twitter_share_base_img.composite!(base_img, 0, 144, OverCompositeOp)
    twitter_share_base_img.write(hash[:twitter_write_url])
  end

  def instagram_square_create_profile_card_data(profile_card, hash)
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
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きなおやつ：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
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

  def instagram_rembg_sticker_create_profile_card_data(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.fill      = hash[:color]
    draw.stroke    = 'transparent'
    draw.gravity   = hash[:others_gravity]
    draw.pointsize = hash[:others_size]
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "誕生日：#{I18n.l profile_card.birthday}  #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "種類：#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きなおやつ：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/user/remove_bg.png').first.resize_to_fill(hash[:face_image_size][0], hash[:face_image_size][1])

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new(hash[:sticker])
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    draw.gravity   =hash[:name_personality_gravity]
    draw.pointsize = 50
    draw.fill = hash[:personality_color]
    draw.annotate(base_img, 0, 0, hash[:personality_position][0], hash[:personality_position][1], profile_card.personality_i18n)

    draw.font      = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = hash[:name_size]
    draw.fill      = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    base_img.write(hash[:write_url])
  end

  def instagram_square_sticker_create_profile_card_data(profile_card, hash)
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
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "好きなおやつ：#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "好きなおもちゃ：#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 70
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(680, 680)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img/instagram/base_img_k_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end

  def wallpaper_square_create_profile_card_data(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    draw = Draw.new
    draw.font      = 'app/assets/fonts/nicomoji-plus_v2.ttf'
    draw.stroke    = 'transparent'
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

  def wallpaper_rembg_sticker_create_profile_card_data(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read('app/assets/images/user/remove_bg.png').first.resize_to_fill(hash[:face_image_size][0], hash[:face_image_size][1])

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new(hash[:sticker])
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end

  def wallpaper_square_sticker_create_profile_card_data(profile_card, hash)
    base_img = ImageList.new(hash[:base_img_url])

    # ここからが顔画像の処理
    profile_face_image = Magick::Image.read(profile_card.face_image.url).first.resize_to_fill(800, 800)

    base_img.composite!(profile_face_image, hash[:face_position][0], hash[:face_position][1], OverCompositeOp)
    # ここまで

    base_img_sticker = ImageList.new('app/assets/images/base_img/wallpaper/base_img_q_sticker.png')
    base_img.composite!(base_img_sticker, 0, 0, OverCompositeOp)

    base_img.write(hash[:write_url])
  end
end
