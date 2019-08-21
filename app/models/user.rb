class User < ActiveRecord::Base
  extend Devise::Models
  after_initialize :set_default_role, if: :new_record?
  # before_create :test
  # :before_add_for_research_groups?

  enum role: { university: 0, research_group: 1, reader: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :registration_keys

  has_many :research_groups, before_add: :test, class_name: "User", foreign_key: "university_id"
  

  belongs_to :university, class_name: "User", optional: true


  private

  def test

    binding.pry

  end

  def set_default_role
    self.role ||= :reader
  end

  def is_user_research_group?
    errors.add(:user, 'Research group cant create users') unless self.university
  end

  # def test
  #   parent = User.find_by(id: self.university_id)
  #   parent.university?
  # end
  # -> { where(role: 'university') }
end
