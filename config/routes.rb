Rails.application.routes.draw do
  get 'deal_dollars/index'
  root 'deal_dollars#index'
end
