class Photo < ApplicationRecord
  mount_uploader :url, PhotoUploader
end
