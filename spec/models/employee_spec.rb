require 'spec_helper'

describe Employee do
  context "Database" do
    it "columns" do
      should have_db_column(:id).of_type(:integer)
      should have_db_column(:first_name).of_type(:string)
      should have_db_column(:last_name).of_type(:string)
      should have_db_column(:gender).of_type(:string).with_options(:limit => 10)
      should have_db_column(:birthday).of_type(:date)
      should have_db_column(:bio).of_type(:text)
      should have_db_column(:role).of_type(:string).with_options(:default => "seller", :limit => 10)
      should have_db_column(:user_id).of_type(:integer)
      should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)
      should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false)
    end

    it "indexes" do
      should have_db_index(:user_id)
    end

    it "association" do
      should belong_to(:user).dependent(:destroy)
    end
  end

  context "Instance Method" do
    it "mass assignment" do
      should allow_mass_assignment_of(:first_name)
      should allow_mass_assignment_of(:last_name)
      should allow_mass_assignment_of(:gender)
      should allow_mass_assignment_of(:birthday)
      should allow_mass_assignment_of(:bio)

      should_not allow_mass_assignment_of(:id)
      should_not allow_mass_assignment_of(:role)
      should_not allow_mass_assignment_of(:user_id)
      should_not allow_mass_assignment_of(:created_at)
      should_not allow_mass_assignment_of(:updated_at)
    end

    it "allow value" do
      %w(first_name last_name).each do |string|
        should allow_value("abc").for(string.to_sym)
        should allow_value("ab-c").for(string.to_sym)
        should allow_value("ab_c").for(string.to_sym)
        should allow_value("ab.c").for(string.to_sym)

        should_not allow_value("ab!c").for(string.to_sym)
        should_not allow_value("ab@c").for(string.to_sym)
        should_not allow_value("ab#c").for(string.to_sym)
      end
    end

    it "ensure length" do
      should ensure_length_of(:gender).is_at_least(1).is_at_most(10)
      should ensure_length_of(:role).is_at_least(1).is_at_most(10)
    end

    it "validate presence" do
      should validate_presence_of(:first_name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:gender)
      should validate_presence_of(:role)
    end
  end

  it "Factory" do
    expect { create :employee }.to change(Employee, :count).by(1)
  end

  it "full_name" do
    e = create :employee
    e.full_name.should eql("John Doe")
  end
end