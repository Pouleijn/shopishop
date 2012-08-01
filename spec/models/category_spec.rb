# encoding: utf-8
require 'spec_helper'

describe Category do
  context "Database" do
    it "columns" do
      should have_db_column(:id).of_type(:integer).with_options(null: false)
      should have_db_column(:position).of_type(:integer)
      should have_db_column(:name).of_type(:string).with_options(null: false, limit: 20)
      should have_db_column(:published).of_type(:boolean).with_options(default: false)
      should have_db_column(:labels_count).of_type(:integer).with_options(default: 0)
      should have_db_column(:created_at).of_type(:datetime).with_options(null: false)
      should have_db_column(:updated_at).of_type(:datetime).with_options(null: false)
    end

    it "indexes" do
      should have_db_index(:name)
    end

    it "association" do
      should have_many(:labelizations).dependent(:destroy)
      should have_many(:labels).through(:labelizations)
    end
  end

  context "Instance Method" do
    it "mass assignment" do
      should allow_mass_assignment_of(:position)
      should allow_mass_assignment_of(:name)
      should allow_mass_assignment_of(:published)

      should_not allow_mass_assignment_of(:id)
      should_not allow_mass_assignment_of(:created_at)
      should_not allow_mass_assignment_of(:updated_at)
    end

    it "allow value" do
      should allow_value("abc").for(:name)
      should allow_value("ab-c").for(:name)
      should allow_value("ab_c").for(:name)
      should allow_value("ab.c").for(:name)

      should_not allow_value("ab!c").for(:name)
      should_not allow_value("ab@c").for(:name)
      should_not allow_value("ab#c").for(:name)
    end

    it "ensure length" do
      should ensure_length_of(:name).is_at_least(1).is_at_most(20)
    end

    it "validate presence" do
      should validate_presence_of(:name)
    end

    it "validate uniqueness" do
      create(:category)
      should validate_uniqueness_of(:name)
    end
  end

  it "should create an new instance" do
    expect { create :category }.to change(Category, :count).by(1)
  end
end