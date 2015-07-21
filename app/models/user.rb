class User < ActiveRecord::Base


  has_secure_password
  has_many :posts

  validates :email,
  presence: true,
  uniqueness: {case_sensative:false}


  validates_presence_of :password, on: :create

  validates :name,
  presence :true,
  uniqueness: {case_sensative:false}
  length: {in: 1..20}

  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end

end