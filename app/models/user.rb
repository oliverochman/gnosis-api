class User < ActiveRecord::Base
  extend Devise::Models
  after_initialize :set_default_role, if: :new_record?

  enum role: [:university, :research_group, :reader]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :registration_keys
  has_many :articles

  private 

  def set_default_role
    self.role ||= :reader
  end
end
