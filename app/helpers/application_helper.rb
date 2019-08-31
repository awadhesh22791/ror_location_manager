module ApplicationHelper
    def gravtar_for(user,options={size:80})
        gravtar_id=Digest::MD5::hexdigest(user.email)
        size=options[:size]
        gravtar_url="https://www.gravatar.com/avatar/#{gravtar_id}?s=#{size}"
        image_tag(gravtar_url,alt:user.username,class:"rounded-circle")
    end
end
