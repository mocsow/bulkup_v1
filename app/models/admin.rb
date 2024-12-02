# == Schema Information
#
# Table name: admins
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_admins_on_email  (email) UNIQUE
#
class Admin < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
