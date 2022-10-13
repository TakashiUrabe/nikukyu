class ProfileCard < ApplicationRecord
  belongs_to :user, optional: true

  mount_uploader :pad_image, PadImageUploader

  def user_id_setting(id)
    self.user_id = id
    self.save
  end
end
