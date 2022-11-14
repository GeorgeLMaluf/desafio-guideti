# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VariacaoAtivo, type: :model do
  let(:variacao) { build(:variacao_ativo) }

  describe '# calculate_d1_variation' do
    it 'when the variation is negative' do
      variacao.calculate_d1_variation(1.20)
      expect(variacao.d1_variation).to be < 0
    end

    it 'when the variation is positive' do
      variacao.calculate_d1_variation(0.90)
      expect(variacao.d1_variation).to be > 0
    end
  end

  describe '# calculate_begin_variation' do
    it 'when the variation is negative' do
      variacao.calculate_begin_variation(1.20)
      expect(variacao.begin_variation).to be < 0
    end

    it 'when the variation is positive' do
      variacao.calculate_begin_variation(1.20)
      expect(variacao.begin_variation).to be < 0
    end
  end
end
