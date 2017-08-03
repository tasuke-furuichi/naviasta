class ImageUploader < CarrierWave::Uploader::Base

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    storage :file
  end
  
  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    process :resize_to_fit => [50, 50]
  end
  

 
  def public_id
    return model.id
  end

end
