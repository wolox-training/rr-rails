require 'rails_helper'

describe User do
  describe '.initialize' do
    it 'creates an user with first and last names' do
      user = described_class.create(
        email: 'test@wolox.com.ar', password: '123123123', password_confirmation: '123123123',
        first_name: 'Test', last_name: 'TestLastName'
      )
      assert user
    end
  end
end
