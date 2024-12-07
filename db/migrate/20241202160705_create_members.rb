class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :business_name
      #t.string :email
      #t.string :password_digest

      t.timestamps
    end
    #add_index :members, :email, unique:true
  end
end
