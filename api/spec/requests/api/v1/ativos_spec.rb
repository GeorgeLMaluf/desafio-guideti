require 'swagger_helper'

RSpec.describe 'api/v1/ativos', type: :request do

  path '/api/v1/ativos/{nome_ativo}' do
    # You'll want to customize the parameter types...
    parameter name: 'nome_ativo', in: :path, type: :string, description: 'nome_ativo'

    post('list ativos') do
      response(200, 'successful') do
        let(:nome_ativo) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
