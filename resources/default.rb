class Publisher::Resources::Default
      
  include Waves::Resources::Mixin
  include Publisher::ResponseMixin

  on( :get, [ :resource, { :name => 'home' }] ) {
    view.show( controller.find( captured.name ) )
  }
  
  on( :get, :show => [{ :name => 'home' }] ) {
    view.show( controller.find( captured.name ) )
  }
     
end