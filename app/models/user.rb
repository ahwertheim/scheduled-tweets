# email:string
# password_digest:string
#
# pasword:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/, message: "must be a valid email address"}

end
