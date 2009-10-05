class Publisher::Resources::Blog < Publisher::Resources::Default
      
  on( :get, :show => [ 'blog', :name ]) {
    blog = model.find( captured.name )
    view( :story ).list( model( :story ).all.reject { |s| ( s.tags & blog.tags ).empty? } )
  }
  
end