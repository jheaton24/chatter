module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for email, options = {}
#    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
#    gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png"
#    image_tag(gravatar_url, alt: "Gravatar not found", class: "gravatar")
    
    options = {:alt => 'avatar', :class => 'avatar', :size => 80}.merge! options
    id = Digest::MD5::hexdigest email.strip.downcase
    url = 'http://www.gravatar.com/avatar/' + id + '.jpg?s=' + options[:size].to_s
    options.delete :size
    image_tag url, options
  end
end
