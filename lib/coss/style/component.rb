module Coss
  module Style
    class Component
      attr_accessor :name, :extension, :path

      def initialize(name, extension = :sass)
        @name, @extension = name, extension
        @path = Style.configuration.css_path + '/components'
      end

      def create
        File.new(name,'w')
      end
    end
  end
end
