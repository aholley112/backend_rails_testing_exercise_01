require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it 'is valid with a title and content of sufficient length' do
      article = Article.new(title: 'Valid Title', content: 'This is valid content that is definitely longer than fifty characters to ensure it meets the requirement.')
      expect(article).to be_valid
    end

    it 'is invalid without a title' do
      article = Article.new(content: 'This is valid content with more than fifty characters.')
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without content' do
      article = Article.new(title: 'Valid Title')
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'is invalid with a title shorter than 5 characters' do
      article = Article.new(title: 'Shrt', content: 'This content is definitely longer than fifty characters and should be valid, but the title is too short.')
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'is invalid with content shorter than 50 characters' do
      article = Article.new(title: 'Valid Title', content: 'Too short')
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("is too short (minimum is 50 characters)")
    end
  end
end
