class Tenant < ActiveRecord::Base

  before_create :generate_api_key

  validates :name, presence: true

  def add_views_count
    self.update_attribute(:views, (views + 1) )
  end

  def self.all_tenant_views
    views = 0
    self.all.map{|x| views += x.views}
    return views
  end

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end

end
