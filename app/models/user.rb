class User < ApplicationRecord

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(provider_id: auth_hash['uid'], provider: auth_hash['provider'])
    user.name = auth_hash['info']['name']
    user.location = auth_hash['info']['location']
    user.image_url = auth_hash['info']['image']
    user.save!
    return user
  end

end
