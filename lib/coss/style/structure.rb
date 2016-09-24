module Coss
  class Structure
    
    # The folder structure of a project built or maintained using the COSS Styleguide
    # looks like that:
    # /stylesheets
    #   /components
    #   /mixins
    #   /variables
    #   style.sass

    attr_accessor :base_path, :full_path, :absolute_path

    FOLDER = [:components, :mixins, :variables]

    FILE = [:"style.sass"]

    def initialize(base_path)
      @base_path = base_path || raise('base_path must be set')
      @full_path = base_path + css_path
      @absolute_path = File.expand_path(@full_path)
    end

    def create
      FOLDER.each do |name|
        dir = absolute_path + '/' + name.to_s
        create_dir(dir)
      end
      FILE.each do |name|
        dir = absolute_path + '/' + name.to_s
        create_file(dir)
      end
    end

    def directory_exist?(dir)
      test(?d, dir)
    end

    def create_dir(name)
      system('mkdir', '-p', name)
    end

    def create_file(name)
      File.new(name,'w')
    end
    
    private
     
      def css_path
        Style.configuration.css_path.gsub('./', '/') ||
          raise('please add css_path to the configuration')
      end

  end
end
