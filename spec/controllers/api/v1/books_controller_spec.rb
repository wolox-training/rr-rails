require 'rails_helper'

describe Api::V1::BooksController do
  include_context 'when logged in'

  it do
    get '/api/v1/books'
    expect(response).to have_http_status(:success)
  end
end
