module Coss
  module Style
    class Component
      attr_accessor :file, :path

      def initialize(name, extension = :sass)
        @file = name, extension
        @path = Style.configuration.css_path + '/components/'
      end

      def create
        File.new(name,'w')
      end

      private

      def name
        path + file.join('.')
      end
      
    end
  end
end
