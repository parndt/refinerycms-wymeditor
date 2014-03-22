module Refinery
  module Wymeditor
    require 'refinery/wymeditor/engine'
    require 'refinery/wymeditor/configuration'

    class << self
      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
