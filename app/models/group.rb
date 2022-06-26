class Group < ApplicationRecord

  attr_accessor :add_name, :delete_name

  has_many :members
  has_many :users, through: :members
  has_many :entries
  has_many :questions, through: :entries
end
