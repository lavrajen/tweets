class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :body
      t.string :tweet_id

      t.timestamps
    end
  end
end
