# frozen_string_literal: true

require 'rest-client'
module Third
  module Yahoo
    class YahooService
      def call
        api_data = fetch_api_data

        return unless api_data
      end

      private

      def fetch_api_data
      end
    end
  end
end