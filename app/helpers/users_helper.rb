module UsersHelper
  def gravatar_url(user, options = {size: 80})
     gravatar_id = Digest::ND5::hexdigest(user.email.downcase)

     size = options[:size]
     "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end

end
