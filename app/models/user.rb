class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :group

  def online?
    if self.last_sign_in_at
      # last_sign_in_at > 1.hour.ago
      !current_sign_in_ip.nil?
    end
  end
end
