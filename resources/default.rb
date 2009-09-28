class Publisher::Resources::Default
      
  include Waves::Resources::Mixin
  include Publisher::ResponseMixin
  
  def show
    view.show( controller.find( captured.name ))
  end

  on( :get, :show => [ :resource, { :name => 'home' }] ) { show }
     
end