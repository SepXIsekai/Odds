Rails.application.routes.draw do
  devise_for :users
  resources :messages
  resources :rooms

  # ✅ เปลี่ยน `root` ให้หน้า Login เป็นหน้าแรก ถ้ายังไม่ได้ Login
  devise_scope :user do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  # ✅ กำหนด `root` ให้เป็น ChatApp ถ้า Login แล้ว
  authenticated :user do
    root to: "rooms#index", as: :authenticated_root
  end

  # Health Check สำหรับ Load Balancer
  get "up" => "rails/health#show", as: :rails_health_check
end
