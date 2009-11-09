class Publisher::Models::Blog < Publisher::Models::Default

  def stories
    model( :story ).all.reject { |s| ( s.tags & self.tags ).empty? }
  end

end
