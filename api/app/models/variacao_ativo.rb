# frozen_string_literal: true

class VariacaoAtivo
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :id, :name, :value, :data, :d1_variation, :begin_variation

  def calculate_d1_variation(d1_value)
    self.d1_variation = (((value - d1_value) / d1_value) * 100.0).round(2) if d1_value.present?
  end

  def calculate_begin_variation(begin_value)
    self.begin_variation = (((value - begin_value) / begin_value) * 100.0).round(2) if begin_value.present?
  end
end
