require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Qoosim', email: 'qoosim@gmail.com', password: 'password', password_confirmation: 'password')
  end

  context "ActiveRecord Association" do
    it { should have_many(:articles) }
  end
  
  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
  end
  
  context "Category Scope" do  
    scenario 'returns the category with highest category' do
      cate1 = Category.create(name: 'Tech', priority: 1)
      cate2 = Category.create(name: 'Book', priority: 2)
      cate3 = Category.create(name: 'Sport', priority: 3)
      
      expect(Category.cate_priority.first).to eq(cate3)
    end
  end
  
end
