# frozen_string_literal: true

class AtivoSerializer < ActiveModel::Serializer
  attributes :id,
              :name,
              :data,
              :value

  def data
    object.data.to_time.to_i
  end

end
