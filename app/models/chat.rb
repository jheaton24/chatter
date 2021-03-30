# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  text       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chat < ApplicationRecord
  belongs_to :user

  validates :text, length: {in: 2..140}
end
