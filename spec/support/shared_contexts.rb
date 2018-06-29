RSpec.shared_context 'when logged in' do
  let :user do
    create :user
  end
  before do
    sign_in :user
  end
end
