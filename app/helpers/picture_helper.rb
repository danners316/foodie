module PictureHelper

  def picture_tag
    image_tag(user.picture.url, :border => 1)
  end

  def thumbnail_tag
    image_tag(user.picture.thimbnail.url, :border => 1)
  end
end
