class Chat < ApplicationRecord
  belongs_to :user

  validates :text, length: {in: 2..140}
end
