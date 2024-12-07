# == Schema Information
#
# Table name: products
#
#  id                     :bigint           not null, primary key
#  bulk_discount_price    :decimal(10, 2)   not null
#  description            :text
#  image_url              :string
#  minimum_order_quantity :integer          not null
#  name                   :string           not null
#  unit_price             :decimal(, )
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Product < ApplicationRecord
  has_many :group_orders, foreign_key: :product
  validates :name, :unit_price, :bulk_discount_price, :minimum_order_quantity, presence: true
end
