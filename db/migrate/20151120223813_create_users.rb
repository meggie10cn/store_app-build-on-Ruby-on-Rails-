class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.column :username, :string
            t.column :password, :string
            t.column :squestion1, :string
            t.column :sanswer1, :string
            t.column :squestion2, :string
            t.column :sanswer2, :string
            t.column :squestion3, :string
            t.column :sanswer3, :string
            t.column :lockable, :integer
            
            t.timestamps
        end
    end
end