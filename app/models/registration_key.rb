class RegistrationKey < ApplicationRecord
  has_secure_token :combination

  belongs_to :user
end
