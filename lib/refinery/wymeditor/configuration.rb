module Refinery
  module Wymeditor
    include ActiveSupport::Configurable

    config_accessor :wymeditor_whitelist_tags

    self.wymeditor_whitelist_tags = {}

  end
end
