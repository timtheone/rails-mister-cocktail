class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :standard do
    resize_to_fit 300, 400
  end

  version :thumbnail do
    cloudinary_transformation width: 120, height: 120, crop: :thumb, gravity: :face
  end
end

