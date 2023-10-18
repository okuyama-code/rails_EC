# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CartProducts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/cart_products/index'
      expect(response).to have_http_status(:success)
    end
  end
end
