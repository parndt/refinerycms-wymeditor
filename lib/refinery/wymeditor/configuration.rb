module Refinery
  module Wymeditor
    include ActiveSupport::Configurable

    config_accessor :whitelist_tags, :intercept_paste

    self.whitelist_tags = {}
    self.intercept_paste = true

  end
end
