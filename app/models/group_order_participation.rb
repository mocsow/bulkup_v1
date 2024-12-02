# == Schema Information
#
# Table name: group_order_participations
#
#  id                  :bigint           not null, primary key
#  quantity_ordered    :integer          not null
#  unit_price_at_order :decimal(10, 2)   not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  group_order_id      :bigint           not null
#  member_id           :bigint           not null
#
# Indexes
#
#  index_group_order_participations_on_group_order_id  (group_order_id)
#  index_group_order_participations_on_member_id       (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_order_id => group_orders.id)
#  fk_rails_...  (member_id => members.id)
#
class GroupOrderParticipation < ApplicationRecord
  belongs_to :group_order
  belongs_to :member
  validates :quantity_ordered, numericality: {greater_than: 0}
end
