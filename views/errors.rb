class Publisher::Views::Errors < Publisher::Views::Default
  
  def not_found_404
    layout {
      div( :class => 'page' ) {
        h1 "Sorry, But We Can't Find That"
        p "This URL cannot be resolved by this server."
      }
    }
  end
  
end