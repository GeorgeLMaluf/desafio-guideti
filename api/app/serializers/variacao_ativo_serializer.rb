# frozen_string_literal: true

class VariacaoAtivoSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :data,
             :value,
             :d1_variation
             :begin_variation
end