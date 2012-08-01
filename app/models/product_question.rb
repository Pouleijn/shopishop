# == Schema Information
#
# Table name: product_questions
#
#  id          :integer         not null, primary key
#  product_id  :integer
#  name        :string(255)
#  email       :string(255)
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class ProductQuestion < ActiveRecord::Base
  attr_accessible :description, :email, :name, :product_id
  
  belongs_to :product
  
  validates :name, :description, :product_id, presence: true
  validates :email, presence: true, :email_format => { check_mx: true }
end
