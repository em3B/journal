class User < ApplicationRecord

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

    devise :database_authenticatable,
    :registerable,
    # :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  has_many :members
  has_many :answers
  has_many :classes, through: :members
  has_many :questions, through: :answers

  attr_accessor :email, :password,
                  :password_confirmation, :remember_me

  def online?
    if self.last_sign_in_at
      # last_sign_in_at > 1.hour.ago
      !current_sign_in_ip.nil?
    end
  end
end
