# frozen_string_literal: true

require 'rails_helper'

describe Book do
  subject(:book) do
    described_class.new(
      genre: genre, author: author, title: title, publisher: publisher,
      year: year, image: image
    )
  end

  let(:genre)  { Faker::Book.genre }
  let(:author) { Faker::Book.author }
  let(:title)  { Faker::Book.title }
  let(:publisher) { Faker::Book.publisher }
  let(:year) { Faker::Number.between(1440, Date.current.year).to_s }
  let(:image) { Faker::Avatar.image }

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
      let(:genre) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'when author is nil' do
      let(:author) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'when title is nil' do
      let(:title) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'when publisher is nil' do
      let(:publisher) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'when year is nil' do
      let(:year) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'when image is nil' do
      let(:image) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
