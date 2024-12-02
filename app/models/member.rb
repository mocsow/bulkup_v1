# == Schema Information
#
# Table name: members
#
#  id              :bigint           not null, primary key
#  business_name   :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_members_on_email  (email) UNIQUE
#
class Member < ApplicationRecord
  has_secure_password
  has_many :group_order_participations
  has_many :group_orders, through: :group_order_participations
  validates :email, presence: true, uniqueness: true
end
