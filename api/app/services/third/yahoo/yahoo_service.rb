# frozen_string_literal: true

require 'rest-client'
module Third
  module Yahoo
    class YahooService
      BASE_YAHOO_URL = 'https://query2.finance.yahoo.com/v8/finance/chart/'
      def call(nome_ativo, start_date, end_date)
        api_data = fetch_api_data(nome_ativo, start_date, end_date)

        return unless api_data

        parse_data_to_database(api_data)
      end

      private

      def fetch_api_data(nome_ativo, start_date, end_date)
        url = "#{BASE_YAHOO_URL}#{nome_ativo}?interval=1d"
        url = "#{url}&period1=#{start_date.to_time.to_i}&period2=#{end_date.to_time.to_i}"

        begin
          response = RestClient.get url
          return [] unless response.code == 200
          JSON.parse(response.body)
        rescue RestClient::ExceptionWithResponse
          return []
        end
      end

      def parse_data_to_database(api_data)
        return if api_data.empty?

        nome_ativo = api_data['chart']['result'][0]['meta']['symbol']
        timestamps = api_data['chart']['result'][0]['timestamp']
        quotes = api_data['chart']['result'][0]['indicators']['quote'][0]['open']
        dailly = timestamps.zip(quotes)
        list_ativos = dailly.map do |day|
          Ativo.find_or_create_by(name: nome_ativo,
                               data: Time.at(day[0]).to_date,
                               value: day[1].round(2))
        end
        list_ativos
      end
    end
  end
end
