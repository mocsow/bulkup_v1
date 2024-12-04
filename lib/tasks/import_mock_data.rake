namespace :mock_data do
  desc "Import mock data from CSV files"
  task import: :environment do
    require 'csv'

    # Import Members
    puts "Importing members..."
    CSV.foreach(Rails.root.join('db/mock_data/members.csv'), headers: true) do |row|
      Member.find_or_create_by!(email: row['email']) do |member|
        member.business_name = row['business_name']
        member.password_digest = row['password_digest']
        member.created_at = row['created_at']
        member.updated_at = row['updated_at']
      end
    end
    puts "Finished importing members."

    # Import Products
    puts "Importing products..."
    CSV.foreach(Rails.root.join('db/mock_data/products.csv'), headers: true) do |row|
      Product.find_or_create_by!(id: row['id']) do |product|
        product.name = row['name']
        product.description = row['description']
        product.image_url = row['image_url']
        product.unit_price = row['unit_price']
        product.bulk_discount_price = row['bulk_discount_price']
        product.minimum_order_quantity = row['minimum_order_quantity']
        product.created_at = row['created_at']
        product.updated_at = row['updated_at']
      end
    end
    puts "Finished importing products."

    # Import Group Orders
    puts "Importing group orders..."
    CSV.foreach(Rails.root.join('db/mock_data/group_orders.csv'), headers: true) do |row|
      GroupOrder.find_or_create_by!(id: row['id']) do |group_order|
        group_order.product_id = row['product_id']
        group_order.total_quantity = row['total_quantity']
        group_order.status = row['status']
        group_order.created_at = row['created_at']
        group_order.updated_at = row['updated_at']
      end
    end
    puts "Finished importing group orders."

    # Import Group Order Participations
    puts "Importing group order participations..."
    CSV.foreach(Rails.root.join('db/mock_data/group_order_participations.csv'), headers: true) do |row|
      GroupOrderParticipation.find_or_create_by!(id: row['id']) do |participation|
        participation.group_order_id = row['group_order_id']
        participation.member_id = row['member_id']
        participation.quantity_ordered = row['quantity_ordered']
        participation.unit_price_at_order = row['unit_price_at_order']
        participation.bulk_discount_price_at_order = row['bulk_discount_price_at_order']
        participation.created_at = row['created_at']
        participation.updated_at = row['updated_at']
      end
    end
    puts "Finished importing group order participations."
  end
end
