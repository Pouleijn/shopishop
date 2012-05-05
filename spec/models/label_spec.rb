require 'spec_helper'

describe Label do
  context "Database" do
    it "columns" do
      should have_db_column(:id).of_type(:integer)
      should have_db_column(:name).of_type(:string).with_options(:limit => 20)
      should have_db_column(:created_at).of_type(:datetime).with_options(:null => false)
      should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false)
    end

    it "indexes" do
      should have_db_index(:name)
    end

    it "association" do
      should have_many(:labelizations).dependent(:destroy)
      should have_many(:categories).through(:labelizations)
    end
  end

  context "Instance Method" do
    it "mass assignment" do
      should allow_mass_assignment_of(:name)
    end

    it "validate presence" do
      should validate_presence_of(:name)
    end

    it "validate uniqueness" do
      create(:label)
      should validate_uniqueness_of(:name)
    end
  end

  it "should create an new instance" do
    expect { create :label }.to change(Label, :count).by(1)
  end
end