# frozen_string_literal: true

class Ativo < ApplicationRecord
  validates_uniqueness_of :name, scope: [:data]
end
