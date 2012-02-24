module Refinery
  module Wymeditor
    class Engine < ::Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_wymeditor

      config.after_initialize do
        Refinery.register_engine(Refinery::Wymeditor)
      end
    end
  end
end
