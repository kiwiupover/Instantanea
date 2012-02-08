# encoding: utf-8

class ScreenShotUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :bigthumb do
    process :resize_to_fill => [1140, 600, Magick::NorthWestGravity]
  end  
  
  version :thumb do
    process :resize_to_fill => [400,300, Magick::NorthWestGravity]
  end
  
  version :smallthumb do
    process :resize_to_fill => [115,110, Magick::NorthWestGravity]
  end

end
