require 'coss/style/version'
require 'coss/style/configuration'
require 'coss/style/structure'
require 'coss/style/component'

module Coss
  module Style
    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end
