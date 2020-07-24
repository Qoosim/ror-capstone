require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Qoosim', email: 'qoosim@gmail.com',
                        password: 'password', password_confirmation: 'password')
  end

  context 'ActiveRecord Association' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end

  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context 'User title creation' do
    scenario 'user can create article' do
      @user.articles.build(title: 'Rails').save
      expect(@user.articles).not_to(be(nil))
    end

    scenario 'User can vote an article' do
      @user.articles.build(text: 'I am a software developer').save
      @user.votes.create(article_id: 1)
      expect(@user.votes.first.user_id).to(be_kind_of(Integer))
    end
  end
end
