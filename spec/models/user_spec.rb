# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    
  end

  describe 'associations' do
    it { should have_many(:recipes).dependent(:destroy) }
    it { should have_many(:foods).dependent(:destroy) }
  end

  
end
