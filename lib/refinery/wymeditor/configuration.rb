module Refinery
  module Wymeditor
    include ActiveSupport::Configurable

    config_accessor :whitelist_tags

    self.whitelist_tags = {}

  end
end
