class Publisher::Resources::Story < Publisher::Resources::Default
      
  on( :get, :show => [{ :name => 'home'}]) { show }
  
end