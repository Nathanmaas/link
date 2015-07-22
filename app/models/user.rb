class User < ActiveRecord::Base


  has_secure_password
  has_many :posts

  validates :email,
  presence: true,
  uniqueness: {case_sensative: false}
  validates_presence_of :password, on: :create
  # format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  validates :name,
  presence: true,
  length: {maximum: 19}

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end