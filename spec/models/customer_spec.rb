require 'spec_helper'

describe Customer do

  subject(:customer) { FactoryGirl.build(:customer) }

  context "when initialized" do
    it "is a new Customer" do
      expect(customer).to be_a_new(Customer)
    end

    it "is not a new String" do
      expect(customer).not_to be_a_new(String)
    end

    it "should be valid with all filled field" do
      expect(customer).to be_valid
    end
  end

  context "when receiving nil params" do
    it "as #name" do
      customer.name= nil
      expect(customer).not_to be_valid
      expect(customer).to have(1).errors_on(:name)
    end

    it "as #email" do
      customer.email= nil
      expect(customer).not_to be_valid
      expect(customer).to have(1).errors_on(:email)
    end

    it "as #birth_date" do
      customer.birth_date= nil
      expect(customer).to be_valid
      expect(customer).to have(:no).errors_on(:birth_date)
    end

    it "as #mobile_number" do
      customer.mobile_number= nil
      expect(customer).to be_valid
      expect(customer).to have(:no).errors_on(:mobile_number)
    end
  end
end
