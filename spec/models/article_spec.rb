require 'rails_helper'

RSpec.describe Article, type: :model do
 
  context "ActiveRecord Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:category) } 
  end
  
  context "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:category_id) }
  end
  
end
