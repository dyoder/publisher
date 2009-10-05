class Publisher::Views::Story < Publisher::Views::Default

  def show( story )
    layout {
      div( :class => :story ) {
        h1 story.title if story.title
        content( story ) { story.content }
      }
    }
  end
  
  def list( stories )
    layout {
      ul( :class => :stories ) {
        stories.sort_by(&:published).reverse.each { |story|
          li( :class => :story ) {
            h4 { a( story.title, :href => paths(:story).show(story.key) ) } 
            byline( story )
            content( story ) { story.summary }
            p { a( "Read more ...", :href => paths(:story).show(story.key))}
    }}}}
  end
  
  def content( story )
    case story.format
    when 'html' then raw( yield )
    when 'textile' then textile( yield )
    else p("Unsupported format.")
    end
  end
  
  def byline( story )
    p( :class => :byline ) {
     raw 'By ' ; span( story.author, :class => :author )
     raw ' on ' ; span( story.published.strftime("%b-%d, %Y"), :class => :published )
    }
  end
  
end