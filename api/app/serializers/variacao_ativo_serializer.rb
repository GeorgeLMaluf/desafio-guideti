# frozen_string_literal: true

class VariacaoAtivoSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :data,
             :value,
             :d1_variation
             :begin_variation

  def data
    object.data.to_time.to_i
  end
end