class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
    	t.integer :user_id
      t.string :name
    	t.text :body
      t.string :profile_image
      t.timestamps null: false
    end
  end
end
