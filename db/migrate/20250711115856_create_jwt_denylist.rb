class CreateJwtDenylist < ActiveRecord::Migration[7.0] # or [8.0] based on your app
  def change
    create_table :jwt_denylist do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
    end
    add_index :jwt_denylist, :jti
  end
end
