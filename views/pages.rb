class Publisher::Views::Pages

  def welcome
    layout {
      h1 'Welcome To The Blog Application'
      p {
        raw "This is an empty Waves application. The good news is that Waves is " <<
             "up and running just fine. Next, you should add your own resources. "
        a "Find out how.", :href => 'http://rubywaves.com/'
      }
    }
  end
  
end