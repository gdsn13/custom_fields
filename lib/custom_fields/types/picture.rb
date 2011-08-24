module CustomFields
  module Types
    module Picture
        
      extend ActiveSupport::Concern
      
      included do
        register_type :picture, nil # do not create the default field
      end
    
      module InstanceMethods
        
        def apply_picture_type(klass)
          
          klass.mount_uploader self._name, PictureUploader

          self.apply_default_type(klass)
        end
          
      end
      
      class PictureUploader < ::CarrierWave::Uploader::Base
      end
    
    end
  end
end
