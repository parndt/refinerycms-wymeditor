module Refinery
  module Wymeditor
    class Engine < ::Rails::Engine
      extend Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_wymeditor

      # set the manifests and assets to be precompiled
      config.to_prepare do
        Rails.application.config.assets.precompile << 'refinery_wymeditor_manifest.js'
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
