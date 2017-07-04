module Refinery
  module Wymeditor
    class Engine < ::Rails::Engine
      extend Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_wymeditor

      # Work around Sprockets not finding our assets
      initializer "add asset paths" do |app|
        asset_path = File.expand_path("../../../../app/assets", __FILE__).freeze
        %w(images javascripts stylesheets).each do |asset_type|
          asset_directory = File.join(asset_path, asset_type).freeze
          if app.assets.paths.exclude?(asset_directory)
            app.assets.prepend_path asset_directory
          end
        end
      end

      # set the manifests and assets to be precompiled
      config.to_prepare do
        Rails.application.config.assets.precompile += %w(
          wymeditor.css
          theme.css
          wymeditor/lang/*
          wymeditor/skins/refinery/*
          wymeditor/skins/refinery/**/*
          refinery/wymeditor.js
        )
      end

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_wymeditor"
          plugin.hide_from_menu = true
          plugin.menu_match = %r{refinery/wymeditor}
        end
      end

      config.after_initialize do
        Refinery.register_engine Refinery::Wymeditor
      end

      after_inclusion do
        %w(wymeditor wymeditor/skins/refinery/skin).each do |stylesheet|
          Refinery::Core.config.register_visual_editor_stylesheet stylesheet
        end

        %W(refinery/wymeditor wymeditor/lang/#{::I18n.locale} wymeditor/skins/refinery/skin).each do |javascript|
          Refinery::Core.config.register_visual_editor_javascript javascript
        end

        Refinery::Pages.config.friendly_id_reserved_words << 'wymiframe'
      end
    end
  end
end
