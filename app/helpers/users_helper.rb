module UsersHelper
    # Returns the Gravatar for the given user.
    def gravatar_for(user, options = { size: 80 })
    	if user.image
    		size = options[:size]
    		gravatar_url = user.image + "?&height=#{size}&width=#{size}"
    	else
    		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    		size = options[:size]
    		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    	end
    	image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end
end
