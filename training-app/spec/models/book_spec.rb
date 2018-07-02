require 'rails_helper'

describe Book do
  subject(:book) do
    create(:book)
  end

  it 'has an author' do
    is_expected.to validate_presence_of(:author)
  end
  it 'has a genre' do
    is_expected.to validate_presence_of(:genre)
  end
  it 'has an image' do
    is_expected.to validate_presence_of(:image)
  end
  it 'has a title' do
    is_expected.to validate_presence_of(:title)
  end
  it 'has a publisher' do
    is_expected.to validate_presence_of(:publisher)
  end
  it 'has a year' do
    is_expected.to validate_presence_of(:year)
  end

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'when genre is nil' do
      it do
        book.genre = nil
        is_expected.to be_invalid
      end
    end
    context 'when author is nil' do
      it do
        book.author = nil
        is_expected.to be_invalid
      end
    end
    context 'when title is nil' do
      it do
        book.title = nil
        is_expected.to be_invalid
      end
    end
    context 'when publisher is nil' do
      it do
        book.publisher = nil
        is_expected.to be_invalid
      end
    end
    context 'when year is nil' do
      it do
        book.year = nil
        is_expected.to be_invalid
      end
    end
    context 'when image is nil' do
      it do
        book.image = nil
        is_expected.to be_invalid
      end
    end
  end
end
