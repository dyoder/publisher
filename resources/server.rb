class Publisher::Resources::Server 
      
  include Waves::Resources::Mixin
  include Publisher::ResponseMixin
  
  # URLs with zero or 1 path component are shorthand links to stories
  on( :get, [ 0..1 ] ) { to( :story ) }

  # otherwise, capture the resource and delegate accordingly
  on( :get, [ :resource, true ] ) { to( captured.resource ) }
  
end