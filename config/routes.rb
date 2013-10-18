TodoList::Application.routes.draw do

  scope "api" do
  	resources :items
  end

  root to: "main#index"
  match '*path', to: "main#index"
end
