# == Schema Information
#
# Table name: group_orders
#
#  id             :bigint           not null, primary key
#  status         :string           default("pending"), not null
#  total_quantity :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint
#
# Indexes
#
#  index_group_orders_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class GroupOrder < ApplicationRecord
  belongs_to :product
  has_many :group_order_participations
  has_many :members, through: :group_order_participations
  validates :status, inclusion: { in: %w[pending full placed delivered] }
end
