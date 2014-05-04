Refinery::Core::Engine.routes.draw do
  get 'wymiframe(/:id)', :to => 'fast#wymiframe', :as => :wymiframe
end
