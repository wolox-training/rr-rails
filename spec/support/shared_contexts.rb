RSpec.shared_context 'when logged in' do
  let :user do
    create :user
  end
  sign_in :user
end
