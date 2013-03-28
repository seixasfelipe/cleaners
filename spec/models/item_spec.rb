require 'spec_helper'

describe Item do

  subject(:item) { FactoryGirl.build(:item) }

  context "when initialized" do
    it "is a new Item" do
      expect(item).to be_a_new(Item)
    end

    it "is not a new String" do
      expect(item).not_to be_a_new(String)
    end

    it "should be valid with all filled field" do
      expect(item).to be_valid
    end
  end

  context "when receiving nil params" do
    it "as #name" do
      item.name= nil
      expect(item).not_to be_valid
      expect(item).to have(1).errors_on(:name)
    end

    it "as #price" do
      item.price= nil
      expect(item).not_to be_valid
      expect(item).to have(1).errors_on(:price)
    end

    it "as #active" do
      item.active= nil
      expect(item).not_to be_valid
      expect(item).to have(1).errors_on(:active)
    end
  end

  context "when receiving valid params" do
    it "as false #active" do
      item.active= false
      expect(item).to be_valid
      expect(item).to have(:no).errors_on(:active)
    end
  end

  context "when deleting" do
    it "#active field should have true value" do
      expect(item.active).to be_true
      item.destroy
      expect(item.persisted?).to be_true
      expect(item.active).to be_false
    end

    it "should not update if #active field is false" do
      updated_at = item.updated_at
      item.active= false
      item.destroy
      expect(item.updated_at).to eq updated_at
      expect(item.active).to be_false
    end
  end
end
