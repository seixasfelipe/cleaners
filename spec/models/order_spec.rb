require 'spec_helper'

describe Order do

  subject(:order) { FactoryGirl.build(:order) }

  context "when initialized" do
    it "is a new Order" do
      expect(order).to be_a_new(Order)
    end

    it "should be valid with all filled field" do
      expect(order).to be_valid
    end
  end

  context "when receiving nil params" do
    it "as #order_date" do
      order.order_date = nil
      expect(order).not_to be_valid
      expect(order).to have(1).errors_on(:order_date)
    end

    it "as #vehicle" do
      order.vehicle = nil
      expect(order).not_to be_valid
      expect(order).to have(1).errors_on(:vehicle)
    end

    it "as #closed" do
      order.closed = nil
      expect(order).not_to be_valid
      expect(order).to have(1).errors_on(:closed)
    end
  end
end
