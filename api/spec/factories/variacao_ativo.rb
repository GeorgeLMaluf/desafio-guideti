# frozen_string_literal: true

FactoryBot.define do
  factory :variacao_ativo do
    id { 1 }
    name { 'PETR4.SA' }
    data { Date.today }
    value { 1.0 }
    d1_variation { nil }
    begin_variation { nil }
  end
end