# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_create_by_email(:email => "info@bed4you.nl", :password => "admin", :password_confirmation => "admin")

%w(boxspring ledikanten seniorenbedden matrassen bodems meubelen kasten).each_with_index do |name, index|
  Category.find_or_create_by_name(:position => index, :name => name, :published => true)
end

%w(1-persoons 2-persoons twijfelaar).each do |type|
  Label.find_or_create_by_name(:name => type)
end

%w(boxspring ledikanten seniorenbedden matrassen).each do |name|
  c = Category.find_by_name(name)
  %w(1-persoons 2-persoons twijfelaar).each_with_index do |type, index|
    l = Label.find_by_name(type)
    unless Labelization.exists?(:category_id => c.id, :label_id => l.id)
      Labelization.create!(:category_id => c.id, :label_id => l.id, :position => index, :published => true)
    end
  end
end