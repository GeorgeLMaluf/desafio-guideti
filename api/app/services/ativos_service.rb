# frozen_string_literal: true

class AtivosService
  def load_ativo(nome_ativo)
    end_date = Date.today
    start_date = end_date - 30.days

    ativos = Ativo.where("lower(name) = ?", nome_ativo.downcase).and(
      Ativo.where(:data => start_date..end_date)
    )

    response = ativos.map do |ativo|
      AtivoSerializer.new(ativo)
    end

    response
  end
end