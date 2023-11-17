# spec/helpers/users_helper_spec.rb
require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe "#format_user_name" do
    it "formats the user name correctly" do
      user = create(:user, name: "john")
      expect(helper.format_user_name(user)).to eq("John")
    end
  end
end
