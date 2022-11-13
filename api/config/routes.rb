Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
      get 'ativos/:nome_ativo', to: 'ativos#index', as: 'ativos', constraints: { nome_ativo: /[^\/]+/}
    end
  end
end