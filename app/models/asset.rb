# == Schema Information
#
# Table name: assets
#
#  id                 :integer         not null, primary key
#  asset_able_id      :integer
#  asset_able_type    :string(255)
#  asset_file_name    :string(255)
#  asset_content_type :string(255)
#  asset_file_size    :integer
#  asset_updated_at   :datetime
#

class Asset < ActiveRecord::Base
	attr_accessible :asset

	belongs_to :asset_able, :polymorphic => true

	has_attached_file :asset, 
		:styles => { :large => "360x268>", :medium => "260x180#", :thumb => "160x120#" }
		# :storage => :s3,
  #   :s3_credentials => "#{Rails.root}/config/aws-s3.yml",
  #   :s3_protocol => "https",
  #   :s3_permissions => :private,
  #   :path => (Rails.env == "production" ? "/production/:class:id/:style/:filename" : "/staging/:class:id/:style/:filename"),
  #   :bucket => "bed4you-production",
  #   :url => ":s3_eu_url"

  validates_attachment_presence :asset
  validates_attachment_content_type :asset, :content_type => ['image/jpeg', 'image/pjpeg', 'image/jpg', 'image/png', 'image/x-png']  
end
