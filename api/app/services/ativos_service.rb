# frozen_string_literal: true

class AtivosService
  def load_ativo(nome_ativo)
    end_date = Date.today
    start_date = end_date - 30.days

    list_ativos = list_ativos_from_database(nome_ativo, start_date, end_date)

    if list_ativos.empty?
      list_ativos =  Third::Yahoo::YahooService.new.call(nome_ativo, start_date, end_date)      
    end

    map_ativos_to_variacao(list_ativos)
  end

  private

  def map_ativos_to_variacao(ativos_list)
    return if ativos_list.nil?

    ativos_list.map.with_index do |ativo, index|
      variacao = VariacaoAtivo.new(id: ativo.id, name: ativo.name,
                                   data: ativo.data, value: ativo.value,
                                   d1_variation: nil, begin_variation: nil)
      if index.positive?
        variacao.calculate_begin_variation(ativos_list[0].value)
        variacao.calculate_d1_variation(ativos_list[index - 1].value)
      end
      variacao
    end
  end

  def list_ativos_from_database(nome_ativo, start_date, end_date)
    Ativo.where('lower(name) = ?', nome_ativo.downcase).and(
        Ativo.where(data: start_date..end_date)
    )
  end
end
