module Refinery
  module Wymeditor
    class Engine < ::Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_wymeditor

      # set the manifests and assets to be precompiled
      initializer "refinery.wymeditor.assets.precompile" do |app|
        app.config.assets.precompile += [
          "wymeditor/lang/*",
          "wymeditor/skins/refinery/*",
          "wymeditor/skins/refinery/**/*"
        ]
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Wymeditor)
      end

      config.to_prepare do
        Refinery::Core.register_stylesheet 'wymeditor'
        Refinery::Core.register_javascript 'refinery/wymeditor'
        Refinery::Core.register_javascript "wymeditor/lang/#{::I18n.locale}"
        Refinery::Core.register_javascript "wymeditor/skins/refinery/skin"
      end
    end
  end
end
