class ProfileCard < ApplicationRecord
  include ImageRecognition
  include CreateProfileCard
  include RemoveBackground

  belongs_to :user, optional: true
  belongs_to :breed, optional: true

  validates :name, presence: true, length: { maximum: 15 }
  validates :pad_image, presence: true

  mount_uploader :pad_image, PadImageUploader
  mount_uploader :face_image, FaceImageUploader
  mount_uploader :profile_card_data_a, ProfileCardDataUploader
  mount_uploader :profile_card_data_b, ProfileCardDataUploader
  mount_uploader :profile_card_data_c, ProfileCardDataUploader
  mount_uploader :profile_card_data_d, ProfileCardDataUploader
  mount_uploader :profile_card_data_e, ProfileCardDataUploader
  mount_uploader :profile_card_data_f, ProfileCardDataUploader
  mount_uploader :profile_card_data_g, ProfileCardDataUploader
  mount_uploader :profile_card_data_h, ProfileCardDataUploader
  mount_uploader :profile_card_data_i, ProfileCardDataUploader
  mount_uploader :profile_card_data_j, ProfileCardDataUploader
  mount_uploader :profile_card_data_k, ProfileCardDataUploader
  mount_uploader :profile_card_data_l, ProfileCardDataUploader

  enum gender: { male: 1, female: 2 }
  enum personality: { typeA: 1, typeB: 2, typeC: 3, typeD: 4, typeE: 5, typeF: 6, typeG: 7, typeH: 8, typeI: 9, typeJ: 10 }
  enum card_type: { hide: 1, A: 2, B: 3, C: 4, D: 5, E: 6, F: 7, G: 8, H: 9, I: 10, J: 11, K: 12, L: 13 }

  def user_id_setting(id)
    self.user_id = id
    save
  end
end
