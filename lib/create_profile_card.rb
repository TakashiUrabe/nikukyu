module CreateProfileCard
  require 'rmagick'
  include Magick

  def create_profile_card
    hash_a = {'base_img_url': './app/assets/images/base_img_a.png', 'color': '#3d3b3e', 'personality_position': [-200,-85], 'birthday_position': [-200,-35], 'breed_position': [-200,10], 'treat_position': [-200,55], 'toy_position': [-200,100], 'name_color': '#3d3b3e', 'name_position': [-200,-150], 'face_position': [900,100], 'write_url': './app/assets/images/profile_card_data_a.jpg'}
    hash_b = {'base_img_url': './app/assets/images/base_img_b.png', 'color': '#3d3b3e', 'personality_position': [-100,-90], 'birthday_position': [-100,-40], 'breed_position': [-100,5], 'treat_position': [-100,50], 'toy_position': [-100,95], 'name_color': '#3d3b3e', 'name_position': [-100,-150], 'face_position': [980,120], 'write_url': './app/assets/images/profile_card_data_b.jpg'}
    hash_c = {'base_img_url': './app/assets/images/base_img_c.png', 'color': 'white', 'personality_position': [-270,-60], 'birthday_position': [-270,-10], 'breed_position': [-270,35], 'treat_position': [-270,80], 'toy_position': [-270,125], 'name_color': '#d8b469', 'name_position': [-270,-140], 'face_position': [820,100], 'write_url': './app/assets/images/profile_card_data_c.jpg'}
    hash_d = {'base_img_url': './app/assets/images/base_img_d.jpeg', 'color': '#3d3b3e', 'personality_position': [-20,-150], 'birthday_position': [-20,5], 'breed_position': [-20,50], 'treat_position': [-20,95], 'toy_position': [-20,140], 'name_color': '#3d3b3e', 'name_position': [-20,-75], 'face_position': [1000,120], 'write_url': './app/assets/images/profile_card_data_d.jpg'}

    [hash_a, hash_b, hash_c, hash_d].each do |hash_each|
      create_profile_card_data(self,hash_each)
    end

    self.profile_card_data_a = File.open(hash_a[:write_url], 'r')
    self.profile_card_data_b = File.open(hash_b[:write_url], 'r')
    self.profile_card_data_c = File.open(hash_c[:write_url], 'r')
    self.profile_card_data_d = File.open(hash_d[:write_url], 'r')
    save
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
    draw.annotate(base_img, 0, 0, hash[:birthday_position][0], hash[:birthday_position][1], "????????????#{I18n.l profile_card.birthday}    #{profile_card.gender_i18n}")
    draw.annotate(base_img, 0, 0, hash[:breed_position][0], hash[:breed_position][1], "?????????#{profile_card.breed.name}")
    draw.annotate(base_img, 0, 0, hash[:treat_position][0], hash[:treat_position][1], "?????????????????????#{profile_card.favorite_treat}") if profile_card.favorite_treat != ''
    draw.annotate(base_img, 0, 0, hash[:toy_position][0], hash[:toy_position][1], "????????????????????????#{profile_card.favorite_toy}") if profile_card.favorite_toy != ''

    draw.font = 'app/assets/fonts/keifont.ttf'
    draw.pointsize = 50
    draw.fill = hash[:name_color]
    draw.annotate(base_img, 0, 0, hash[:name_position][0], hash[:name_position][1], profile_card.name)

    # ?????????????????????????????????
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
    # ????????????

    base_img.write(hash[:write_url])
  end
end
