module UserHelper
  def gravatar_for user
    gravatar_id = Digest::MD5::hexdigest user.user_name.downcase
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag gravatar_url, alt: user_path, class: "gravatar"
  end
end