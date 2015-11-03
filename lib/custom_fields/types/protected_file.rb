module CustomFields
  module Types
    module ProtectedFile
        
      extend ActiveSupport::Concern
      
      included do
        register_type :protected_file, nil # do not create the default field
      end
    
      module InstanceMethods
        
        def apply_protected_file_type(klass)
          
          klass.mount_uploader self._name, ProtectedFileUploader

          self.apply_default_type(klass)
        end
          
      end
      
      class ProtectedFileUploader < ::CarrierWave::Uploader::Base
      end
    
    end
  end
end