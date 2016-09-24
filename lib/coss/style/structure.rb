module Coss
  class Structure
    
    # The folder structure of a project built or maintained using the COSS Styleguide
    # looks like that:
    # /stylesheets
    #   /components
    #   /mixins
    #   /variables
    #   style.sass

    FOLDER = {
      stylesheets: {
        components: :folder,
        mixins: :folder,
        variables: :folder,
        style: :file,
      }
    }

  end
end
