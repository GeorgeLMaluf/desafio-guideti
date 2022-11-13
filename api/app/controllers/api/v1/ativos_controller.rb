module Api
  module V1
    class AtivosController < ApplicationController
      def index
        actives_history = AtivosService.new.load_ativo(params[:nome_ativo])

        render json: { data: actives_history,
                       status: :ok,
                       type: 'Success' }
      end
    end
  end
end