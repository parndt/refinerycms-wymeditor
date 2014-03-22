module Refinery
  class WymeditorGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def generate_refinery_initializer
      template "config/initializers/refinery/wymeditor.rb.erb",
               File.join(destination_root, "config", "initializers", "refinery", "wymeditor.rb")
    end
  end
end
