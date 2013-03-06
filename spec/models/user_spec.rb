require 'spec_helper'

describe User do

  context "when initialized" do

    subject(:user) { FactoryGirl.build(:user) }

    it "is a new user" do
      expect(user).to be_a_new(User)
    end

    it "is not a new AdminUser" do
      expect(user).not_to be_a_new(String)
    end

    context "with invalid params" do
      it "like 'username' with 'nil' value" do
        user.username= nil
        expect(user).not_to be_valid
        expect(user).to have(1).errors_on(:username)
      end

      it "like 'first_name' with 'nil' value" do
        user.first_name= nil
        expect(user).not_to be_valid
        expect(user).to have(1).errors_on(:first_name)
      end

      it "like 'last_name' with 'nil' value" do
        user.last_name= nil
        expect(user).not_to be_valid
        expect(user).to have(1).errors_on(:last_name)
      end

      it "like 'email' with 'nil' value" do
        user.email= nil
        expect(user).not_to be_valid
        expect(user).to have(1).errors_on(:email)
      end

      describe "having characteres" do
        describe "in downcase" do
          it "like 'username' with its length less than 2" do
            user.username= 'a'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:username)
          end

          it "like 'username' with its length more than 20" do
            user.username= 'abcdefghijklmnopqrstuvxywz'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:username)
          end

          it "like 'first_name' with its length less than 2" do
            user.first_name= 'a'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:first_name)
          end

          it "like 'first_name' with its length more than 20" do
            user.first_name= 'abcdefghijklmnopqrstuvxywz'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:first_name)
          end

          it "like 'last_name' with its length less than 2" do
            user.last_name= 'a'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:last_name)
          end

          it "like 'last_name' with its length more than 20" do
            user.last_name= 'abcdefghijklmnopqrstuvxywz'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:last_name)
          end
        end

        describe "in uppercase" do
          it "like 'username' with its length less than 2" do
            user.username= 'A'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:username)
          end

          it "like 'username' with its length more than 20" do
            user.username= 'ABCDEFGHIJKLMNOPQRSTUVXYWZ'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:username)
          end

          it "like 'first_name' with its length less than 2" do
            user.first_name= 'A'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:first_name)
          end

          it "like 'first_name' with its length more than 20" do
            user.first_name= 'ABCDEFGHIJKLMNOPQRSTUVXYWZ'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:first_name)
          end

          it "like 'last_name' with its length less than 2" do
            user.last_name= 'A'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:last_name)
          end

          it "like 'last_name' with its length more than 20" do
            user.last_name= 'ABCDEFGHIJKLMNOPQRSTUVXYWZ'
            expect(user).not_to be_valid
            expect(user).to have(1).errors_on(:last_name)
          end
        end
      end
    end

    context "with valid params" do
      it "like 'email' with a non email value" do
        user.email= '@'
        expect(user).not_to be_valid
        expect(user).to have(2).errors_on(:email)
      end

      it "like 'email' with an email value" do
        user.email= 'test@test.com'
        expect(user).to be_valid
        expect(user).to have(0).errors_on(:email)
      end
    end
  end
end
