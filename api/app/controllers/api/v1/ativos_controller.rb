module Api
  module V1
    class AtivosController < ApplicationController
      def index
        actives_history = AtivosService.new.load_ativo(params[:nome_ativo])

        render json: actives_history, status: :ok
      end
    end
  end
end