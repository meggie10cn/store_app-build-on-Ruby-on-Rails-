class CreateBuyers < ActiveRecord::Migration
  def change
          create_table :buyers do |t|
              t.column :username, :string
              t.column :password, :string
              t.column :squestion1, :string
              t.column :sanswer1, :string
              t.column :squestion2, :string
              t.column :sanswer2, :string
              t.column :squestion3, :string
              t.column :sanswer3, :string
              t.column :lockable, :integer,default:1
              
              t.timestamps
          end

      end
  end


