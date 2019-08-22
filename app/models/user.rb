class User < ActiveRecord::Base
  extend Devise::Models
  after_initialize :set_default_role, if: :new_record?

  enum role: { university: 0, research_group: 1, reader: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :registration_keys

  validates :sign_up_registration_key, presence: true, length: {minimum: 24}

  private 

  def set_default_role
    self.role ||= :reader
  end
end
