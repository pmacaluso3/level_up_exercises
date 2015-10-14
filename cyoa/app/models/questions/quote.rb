class Quote < Question

  def ron_said_it?
    self.name == "ron"
  end
end