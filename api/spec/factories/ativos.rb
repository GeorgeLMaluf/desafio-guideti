# frozen_string_literal: true

FactoryBot.define do
  factory :ativo do
    name { 'PETR4.SA' }
    data { Date.today }
    value { 1.0 }
  end
end
