class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: %i(google)
  before_create :generate_uuid

  def generate_uuid
    random_code = nil
    loop do
      random_code = SecureRandom.urlsafe_base64(40, false)
      break unless User.where(uuid: random_code).exists?
    end
    self.uuid = random_code
  end

  protected

  def self.find_for_google(auth)
    user = User.find_or_initialize_by(email: auth.info.email)

    if user.new_record?
      user = User.create(
        name:     auth.info.name,
        provider: auth.provider,
        uid:      auth.uid,
        token:    auth.credentials.token,
        password: Devise.friendly_token[0, 20],
      )
    end
    user
  end
end
