require 'spec_helper'

describe Vehicle do
  subject(:vehicle) { FactoryGirl.build(:vehicle) }

  context "when initialized" do
    it "is a new Vehicle" do
      expect(vehicle).to be_a_new(Vehicle)
    end

    it "is not a new String" do
      expect(vehicle).not_to be_a_new(String)
    end
  end

  context "when receiving nil params" do
    it "as #license_plate" do
      vehicle.license_plate = nil
      expect(vehicle).not_to be_valid
      expect(vehicle).to have(1).errors_on(:license_plate)
    end

    it "as #model" do
      vehicle.model = nil
      expect(vehicle).to be_valid
      expect(vehicle).to have(:no).errors_on(:model)
    end

    it "as #color" do
      vehicle.color = nil
      expect(vehicle).to be_valid
      expect(vehicle).to have(:no).errors_on(:color)
    end

    it "as #brand" do
      vehicle.brand = nil
      expect(vehicle).to be_valid
      expect(vehicle).to have(:no).errors_on(:brand)
    end

    it "as #customer" do
      vehicle.customer = nil
      expect(vehicle).not_to be_valid
      expect(vehicle).to have(1).errors_on(:customer)
    end
  end

end
