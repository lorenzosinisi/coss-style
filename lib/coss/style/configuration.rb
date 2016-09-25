module Coss
  module Style
    class Configuration
      attr_accessor :css_path, 
                    :strict_mode,
                    :extras,
                    :absolute_path

    def self.absolute_path
      File.expand_path(css_path)
    end

    end
  end
end
