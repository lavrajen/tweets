class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.timestamps

      t.references :profile_picture, null: true, foreign_key: { to_table: :active_storage_blobs }
    end
  end
end
