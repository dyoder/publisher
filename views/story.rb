class Publisher::Views::Story < Publisher::Views::Default

  def show( story )
    layout {
      h1 story.title if story.title
      case story.format
      when 'html' then raw( story.content )
      when 'textile' then textile( story.content )
      else p("Unsupported format.")
      end
    }
  end
  
end