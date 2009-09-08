class Publisher::Views::Story < Publisher::Views::Default

  def show( story )
    layout {
      h1 story.title if story.title
      textile( story.content )
    }
  end
  
end