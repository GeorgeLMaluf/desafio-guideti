# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "VariacaoAtivoSerializer", type: :serializer do
  let(:variacao) { build(:variacao_ativo) }
  let(:serialization) { ActiveModelSerializers::SerializableResource.new(
                          variacao,
                          serializer: VariacaoAtivoSerializer) }
  let(:subject) { JSON.parse(serialization.to_json) }

  it 'check if the serialized attributes match' do
    expect(subject['id']).to eq(variacao.id)
    expect(subject['name']).to eq(variacao.name)
    expect(subject['value']).to eq(variacao.value)
    expect(subject['data']).to eq(variacao.data.strftime("%Y-%m-%d"))
    expect(subject['d1_variation']).to be_nil
    expect(subject['begin_variation']).to be_nil
  end
end