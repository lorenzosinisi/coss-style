module Coss
  module Style
    class Component
      attr_accessor :file, :path, :component_name

      def initialize(name, extension = :sass)
        @component_name = name
        @file = name, extension
        @path = Style.configuration.css_path + '/components/'
      end

      def create
        unless exists?
          File.open(name, 'w') { |file| file.write(template) }
        end
      end

      def exists?
        File.exist?(name)
      end

      def template
        ".#{component_name}"
      end

      private

      def name
        path + file.join('.')
      end

    end
  end
end
