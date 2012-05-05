require 'spec_helper'

describe User do 
  context "Database" do
    it "columns" do
      should have_db_column(:id).of_type(:integer)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
      should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)
      should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false)
    end

    it "indexes" do
      should have_db_index(:email)
    end

    it "association" do
      should have_one(:employee)
  	end
  end
	
  context "Instance Method" do
    it "mass assignment" do
      should allow_mass_assignment_of(:email)
      should allow_mass_assignment_of(:password)
      should allow_mass_assignment_of(:password_confirmation)
    end

    it "validate presence" do
      should validate_presence_of(:email)
      should validate_presence_of(:password)
      should validate_presence_of(:password_confirmation)
    end

    it "validate uniqueness" do
      create(:user)
      should validate_uniqueness_of(:email)
    end
  end

  it "should create an new instance" do
    expect { create :user }.to change(User, :count).by(1)
  end	
end