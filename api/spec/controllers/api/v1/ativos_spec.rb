# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Api::V1::Ativos", type: :request do
  let!(:ativo_hoje) { create(:ativo) }
  let!(:ativo_ontem) {create(:ativo, data: Date.today - 1.day, value: 0.8) }

  it 'Get a valid active' do
    post '/api/v1/ativos/PETR4.SA'

    expect(response).to have_http_status(:ok)
    expect(response.body).not_to be_empty
  end
end
