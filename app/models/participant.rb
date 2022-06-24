class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :questions
end
