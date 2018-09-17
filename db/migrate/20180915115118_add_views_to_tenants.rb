class AddViewsToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :views, :integer, after: :api_key, default: 0
  end
end
