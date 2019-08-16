class RegistrationKey < ApplicationRecord
  belongs_to :user
  validates_presence_of :combination
end
