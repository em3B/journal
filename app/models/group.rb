class Group < ApplicationRecord
  include Abyme::Model

  attr_accessor :add_name, :delete_name

  has_many :members
  has_many :users, through: :members, dependent: :destroy
  abymize :users, permit: :all_attributes

  abymize :users, permit: :all_attributes

  abymize :users, permit: [:username, :email, :password]

  abymize :users

  has_many :entries
  has_many :questions, through: :entries

  def abyme_attributes
    return {user_attributes: [:username, :email, :password]}
  end
end
