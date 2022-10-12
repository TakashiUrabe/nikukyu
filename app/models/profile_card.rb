class ProfileCard < ApplicationRecord
  belongs_to :user, optional: true

  mount_uploader :pad_image, PadImageUploader
end
