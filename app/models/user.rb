class User < ApplicationRecord
  User.connection()
  include Abyme::Model
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

    devise :database_authenticatable,
    :registerable,
    # :confirmable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable

  belongs_to :group
  has_many :members
  has_many :answers
  has_many :groups, through: :members
  has_many :questions, through: :answers

  attr_accessor :email, :password,
                  :password_confirmation, :remember_me

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def online?
    if self.last_sign_in_at
      # last_sign_in_at > 1.hour.ago
      !current_sign_in_ip.nil?
    end
  end
end
