require 'spec_helper'

describe Address do

  subject(:address) { FactoryGirl.build(:address) }

  context "when initialized" do
    it "is a new Address" do
      expect(address).to be_a_new(Address)
    end

    it "is not a new String" do
      expect(address).not_to be_a_new(String)
    end

    it "should be valid with all filled field" do
      expect(address).to be_valid
    end
  end

  context "when receiving nil params" do
    it "as #city" do
      address.city= nil
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:city)
    end

    it "as #district" do
      address.district= nil
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:district)
    end

    it "as #street" do
      address.street= nil
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:street)
    end

    it "as #zip_code" do
      address.zip_code= nil
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:zip_code)
    end

    it "as #state" do
      address.state= nil
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:state)
    end
  end

  context "when receiving empty params" do
    it "as #city" do
      address.city= ''
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:city)
    end

    it "as #district" do
      address.district= ''
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:district)
    end

    it "as #street" do
      address.street= ''
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:street)
    end

    it "as #zip_code" do
      address.zip_code= ''
      expect(address).to be_valid
      expect(address).to have(:no).errors_on(:zip_code)
    end
  end
end
