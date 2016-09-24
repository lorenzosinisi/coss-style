module Coss
  class Structure
    
    # The folder structure of a project built or maintained using the COSS Styleguide
    # looks like that:
    # /stylesheets
    #   /components
    #   /mixins
    #   /variables
    #   style.sass

    attr_accessor :base_path, :fullpath

    FOLDER = {
      folder: :components,
      folder: :mixins,
      folder: :variables,
      sass: :style,
    }

    def initialize(base_path)
      @base_path = base_path || raise("base_path must be set")
      @fullpath = base_path << css_path
    end

    def css_path
      configuration.css_path || raise("please add css_path to the configuration")
    end

    def create
      FOLDER.each do |element|
      end
    end

    def directory_exist?(dir)
      test(?d, dir)
    end

  end
end
