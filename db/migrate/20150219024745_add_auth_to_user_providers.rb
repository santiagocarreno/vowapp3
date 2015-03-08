class AddAuthToUserProviders < ActiveRecord::Migration
  def change
    add_column :user_providers, :token, :string
    add_column :user_providers, :secret, :string
    add_column :user_providers, :provider_url, :string
    add_column :user_providers, :username, :string
    add_column :user_providers, :reach_in, :integer
    add_column :user_providers, :reach_out, :integer
    add_column :user_providers, :likes, :integer
    add_column :user_providers, :shares, :integer
    add_column :user_providers, :comments, :integer
  end
end
