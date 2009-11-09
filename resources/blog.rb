class Publisher::Resources::Blog < Publisher::Resources::Default

  on( :get, :show => [ 'blog', :name ]) {
    view( :story ).list( model.find( captured.name ).stories )
  }

end
