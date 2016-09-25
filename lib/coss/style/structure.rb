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
      # the order is important
      create_folders && create_files
      true
    end

    def explain
      "The structure of files in COSS should be #{FOLDER.push(FILE).join(', ')}"
    end

    def files_missing
      missing = {}
      missing[:folders] = test_folders
      missing[:files]   = test_files
      missing
    end

    private

    def create_folders
      FOLDER.each do |name|
        dir = absolute_path + '/' + name.to_s
        unless directory_exist?(dir)
          create_dir(dir)
        end
      end
    end

    def create_files
      FILE.each do |name|
        file = absolute_path + '/' + name.to_s
        unless File.exist?(file)
          create_file(file)
        end
      end
    end

    def test_folders
      missing = []
      FOLDER.each do |name|
        dir = absolute_path + '/' + name.to_s
        unless directory_exist?(dir)
          missing << name
        end
      end
      missing
    end

    def test_files
      missing = []
      FILE.each do |name|
        file = absolute_path + '/' + name.to_s
        unless File.exist?(file)
          missing << name
        end
      end
      missing
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
