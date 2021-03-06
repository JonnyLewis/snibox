require 'rails_helper'

describe Snippet do
  describe '#language_suported' do
    let(:snippet_valid_language) { build(:snippet_with_tag, language: 'php') }
    let(:snippet_not_valid_language) { build(:snippet_with_tag, language: 'language') }

    it 'not valid when language isn\'t supported' do
      expect(snippet_not_valid_language).to_not be_valid
    end

    it 'valid when language supported' do
      expect(snippet_valid_language).to be_valid
    end
  end

  describe '#tag_list_size' do
    let(:snippet_valid_tag_list) { build(:snippet_with_tag, label_attributes: { name: 'a' * 20 }) }
    let(:snippet_not_valid_tag_list) { build(:snippet_with_tag, label_attributes: { name: 'a' * 21}) }

    it 'not valid when tags list size more than 20 characters' do
      expect(snippet_not_valid_tag_list).to_not be_valid
    end

    it 'valid when tags list size no more than 20 characters' do
      expect(snippet_valid_tag_list).to be_valid
    end
  end
end
