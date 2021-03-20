class User < ApplicationRecord
  before_save { |user| user.email = email.downcase }

  # Name validation: 
  #   Must be non-blank
  #   Must be betwen 3 and 40 characters long
  #   Must contain only valid characters
  validates(:name,
    presence: true,
    length: { minimum: 3, maximum: 40 } 
  )

  # Email validation:
  #   Must be non-blank
  #   Must be in a valid format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, 
    presence: true, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  )

  # Username validation:
  #   Must be non-blank
  #   Must be unique
  validates(:username, 
    presence: true,
    uniqueness: { case_sensitive: false }
  )

end
