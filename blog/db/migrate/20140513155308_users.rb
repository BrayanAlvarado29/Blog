class Users < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  	  t.string :email
  	  t.string :password
  	  t.string :confirmPassword
  	  t.timestamps
  	end  	
  end 
end