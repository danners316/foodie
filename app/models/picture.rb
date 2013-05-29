class Picture < ActiveRecord::Base
  URL_STUB = "/pictures"
  DIRECTORY = File.join("public","pictures")



  def initialize(user, image = nil)
    @user = user
    @image = image
    Dir.mkdir(DIRECTORY) unless File.directory?(DIRECTORY)
  end

  def exists?
    File.exists? (File.join(DIRECTORY, filename))
  end

  alias exist? exists?

  def url
    "#{URL_STUB}/#{filename}"
  end

  def thumbnail_url
    "#{URL_STUB}/#{thumbnail_name}"
  end

  private

  def filename
    "#{@user.username}.png"
  end

  def thumbnail_name
    "#{@user.username}_thumbnail.png"
  end

end